# $OpenBSD: Makefile,v 1.43 2012/05/26 09:14:34 jasper Exp $

# XXX: Remember to bump MODCLANG_VERSION in lang/clang/clang.port.mk when
# updating this port.

COMMENT =	modular, fast C/C++/ObjC compiler, static analyzer and tools

LLVM_V =	3.2
DISTREALNAME =	llvm-${LLVM_V}
DISTNAME =	bitrig-${DISTREALNAME}
PKGNAME =	bitrig-llvm-${LLVM_V}
REVISION = 	12

CATEGORIES =	bitrig

# packager notes in http://llvm.org/docs/Packaging.html
HOMEPAGE =	http://www.llvm.org/

VMEM_WARNING =	Yes
ONLY_FOR_ARCHS = amd64 i386 arm

# BSD
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

WANTLIB =	c m pthread stdc++

#MASTER_SITES =	http://llvm.org/releases/${LLVM_V}/
MASTER_SITES = https://www.bitrig.org/pub/distfiles/

DISTFILES =	${DISTREALNAME}.src${EXTRACT_SUFX} clang-${LLVM_V}.src${EXTRACT_SUFX}
DISTFILES +=	compiler-rt-20120813.tar.gz
WRKDIST =	${WRKDIR}/llvm-${LLVM_V}.src

post-extract:
	@mv ${WRKDIR}/clang-${LLVM_V}.src ${WRKDIST}/tools/clang
	@mv ${WRKDIR}/compiler-rt ${WRKDIST}/projects/compiler-rt

MODULES =	devel/cmake \
		lang/python

REGRESS_DEPENDS = devel/dejagnu

# yep, the amount of suck is amazing
BUILD_DEPENDS = textproc/py-docutils \
		textproc/py-pygments

MAKE_FLAGS =	OPTIMIZE_OPTION="${CFLAGS}" \
		VERBOSE=Yes \
		INSTALL="install -c"

REGRESS_FLAGS =	RUNTESTFLAGS=

SEPARATE_BUILD =	Yes
USE_LIBTOOL =		Yes
# uncomment if you want to use MAKE_JOBS
USE_GMAKE =		Yes

PREFIX=			/usr
CONFIGURE_STYLE =	cmake
CONFIGURE_ARGS =	-DLLVM_ENABLE_FFI:Bool=False \
			-DLLVM_REQUIRES_RTTI:Bool=True \
			-DLLVM_INCLUDE_TESTS:Bool=True \
			-DLLVM_TARGETS_TO_BUILD:String="ARM;X86" \
			-DCMAKE_INSTALL_PREFIX:PATH=${PREFIX} \
			-DCMAKE_BUILD_TYPE:String=Release

CLANG_INCLUDE_PATH =	lib/clang/${LLVM_V}/include
SUBST_VARS +=		CLANG_INCLUDE_PATH

TMPGIT = ${DISTDIR}/tmpgit

.if ${MACHINE_ARCH:Mamd64}
INSTALL_ARCH = x86_64
PKG_ARGS+=-Damd64=1
.else
INSTALL_ARCH = ${MACHINE_ARCH}
PKG_ARGS+=-Damd64=0
.endif

.if ${MACHINE_ARCH:Mi386}
PKG_ARGS+=-Di386=1
.else
PKG_ARGS+=-Di386=0
.endif

.if ${MACHINE_ARCH:Marm}
PKG_ARGS+=-Darm=1
.else
PKG_ARGS+=-Darm=0
.endif

pre-configure:
	@${SUBST_CMD} ${WRKSRC}/tools/clang/tools/scan-build/scan-build
	-@ln -s ${MODPY_BIN} ${WRKDIR}/bin/python

post-build:
#	pod2man --release=CVS --center="LLVM Command Guide" \
#	    $$i man/man1/$${i%.pod}.1; \
#
#	rst2man blows chunks but it is all i got right now
	mkdir -p ${WRKSRC}/docs/CommandGuide/man/man1
	cd ${WRKSRC}/docs/CommandGuide && for i in *.rst; do \
		rst2man $$i > man/man1/$$i.1; \
	done
	pod2man --release=CVS --center="LLVM Command Guide" \
	    ${WRKSRC}/tools/clang/docs/tools/clang.pod \
	    ${WRKSRC}/docs/CommandGuide/man/man1/clang.1

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/tools/clang/tools/scan-build/ccc-analyzer \
	    ${WRKSRC}/tools/clang/tools/scan-build/c++-analyzer \
	    ${WRKSRC}/tools/clang/tools/scan-build/scan-build ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/tools/clang/tools/scan-build/sorttable.js \
	    ${WRKSRC}/tools/clang/tools/scan-build/scanview.css \
	    ${PREFIX}/share/llvm
	${INSTALL_DATA_DIR} ${PREFIX}/share/man/man1
	${INSTALL_DATA} ${WRKSRC}/docs/CommandGuide/man/man1/* \
	    ${PREFIX}/share/man/man1
	${INSTALL_DATA} ${WRKBUILD}/lib/clang/3.2/lib/bitrig/libclang_rt.${INSTALL_ARCH}.a \
	    ${PREFIX}/lib/libclang_rt.${ARCH}.a

git:
	rm -rf ${DISTDIR}/llvm* ${DISTDIR}/clang* ${DISTDIR}/compiler-rt*
	@mkdir -p ${TMPGIT}
	if test -d ${TMPGIT}/llvm-3.2.src; then \
		(cd ${TMPGIT}/llvm-3.2.src && git pull) \
	else \
		(cd ${TMPGIT} && git clone http://llvm.org/git/llvm.git llvm-3.2.src) \
	fi
	if test -d ${TMPGIT}/clang-3.2.src; then \
		(cd ${TMPGIT}/clang-3.2.src && git pull) \
	else \
		(cd ${TMPGIT} && git clone http://llvm.org/git/clang.git clang-3.2.src) \
	fi	
	if test -d ${TMPGIT}/compiler-rt; then \
		(cd ${TMPGIT}/compiler-rt && git pull) \
	else \
		(cd ${TMPGIT} && git clone http://llvm.org/git/compiler-rt.git) \
	fi
	(cd ${TMPGIT} && tar -zcf ${DISTDIR}/llvm-3.2.src.tar.gz llvm-3.2.src)
	(cd ${TMPGIT} && tar -zcf ${DISTDIR}/clang-3.2.src.tar.gz clang-3.2.src)
	(cd ${TMPGIT} && tar -zcf ${DISTDIR}/compiler-rt-20120813.tar.gz compiler-rt)
	make makesum
	rm -rf ${TMPGIT}

.include <bsd.port.mk>
