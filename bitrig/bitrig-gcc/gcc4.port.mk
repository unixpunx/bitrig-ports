# $OpenBSD: gcc4.port.mk,v 1.8 2012/01/26 13:17:22 pascal Exp $

MODGCC4_ARCHS ?=
MODGCC4_LANGS ?=


.if ${MODGCC4_LANGS:L} != "java" && !${MODGCC4_LANGS:L:Mc}
# Always include support for this
# unless only java is needed
MODGCC4_LANGS +=	c
.endif

_MODGCC4_OKAY = c c++ java fortran go
.for _l in ${MODGCC4_LANGS:L}
.  if !${_MODGCC4_OKAY:M${_l}}
ERRORS += "Fatal: unknown language ${_l}"
.  endif
.endfor

_MODGCC4_ARCH_USES = No

.if ${MODGCC4_ARCHS:L} != ""
.  for _i in ${MODGCC4_ARCHS}
.    if !empty(MACHINE_ARCH:M${_i})
_MODGCC4_ARCH_USES = Yes
.    endif
.  endfor
.endif

COMPILER_VERSION ?= gcc2

_MODGCC4_LINKS =
.if ${_MODGCC4_ARCH_USES:L} == "yes"

.  if ${MODGCC4_LANGS:L:Mc}
BUILD_DEPENDS += bitrig/bitrig-gcc>=4.6,<4.7
_MODGCC4_LINKS += egcc gcc egcc cc
.  endif

.  if ${MODGCC4_LANGS:L:Mc++}
BUILD_DEPENDS += bitrig/bitrig-gcc,-c++>=4.6,<4.7
MODGCC4STDCPP = estdc++
LIB_DEPENDS += bitrig/bitrig-gcc,-estdc>=4.6,<4.7
WANTLIB += estdc++>=14
_MODGCC4_LINKS += eg++ g++ eg++ c++
.  endif

.  if ${MODGCC4_LANGS:L:Mfortran}
BUILD_DEPENDS += bitrig/bitrig-gcc,-f95>=4.6,<4.7
WANTLIB += gfortran>=3
LIB_DEPENDS += bitrig/bitrig-gcc,-f95>=4.6,<4.7
_MODGCC4_LINKS += egfortran gfortran
.  endif

.  if ${MODGCC4_LANGS:L:Mjava}
BUILD_DEPENDS += bitrig/bitrig-gcc,-java>=4.6,<4.7
MODGCC4_GCJWANTLIB = gcj
MODGCC4_GCJLIBDEP = bitrig/bitrig-gcc,-java>=4.6,<4.7
_MODGCC4_LINKS += egcj gcj egcjh gcjh egjar gjar egij gij
.  endif

.  if ${MODGCC4_LANGS:L:Mgo}
BUILD_DEPENDS += bitrig/bitrig-gcc,-go>=4.6,<4.7
WANTLIB += go
LIB_DEPENDS += bitrig/bitrig-gcc,-go>=4.6,<4.7
_MODGCC4_LINKS += egccgo gccgo
.  endif
.endif

.if !empty(_MODGCC4_LINKS)
.  for _src _dest in ${_MODGCC4_LINKS}
MODGCC4_post-patch += ln -sf ${LOCALBASE}/bin/${_src} ${WRKDIR}/bin/${_dest};
.  endfor
.endif

