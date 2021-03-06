# $OpenBSD: Makefile,v 1.25 2012/10/10 22:09:29 stu Exp $

COMMENT =	Libedit interface to Tcl/Tk interpreters

DISTNAME =	eltclsh-1.12
CATEGORIES =	lang x11

MASTER_SITES =	http://www.openrobots.org/distfiles/eltclsh/

HOMEPAGE =	http://www.openrobots.org/wiki/eltclsh

MAINTAINER =	Matthieu Herrb <matthieu@openbsd.org>

# BSD
PERMIT_PACKAGE_CDROM =	 Yes
PERMIT_PACKAGE_FTP =	 Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =	 Yes

MODULES +=	x11/tk
WANTLIB += X11 Xext Xft Xrender Xss c edit expat fontconfig freetype
WANTLIB += m termcap xcb z

SEPARATE_BUILD =	Yes
CONFIGURE_STYLE =	gnu

CONFIGURE_ARGS =	--with-tcl=${MODTCL_LIBDIR} \
			--with-tk=${MODTK_LIBDIR} \
			--libdir=\$${prefix}/lib/tcl \
			--datadir=\$${prefix}/lib/tcl

USE_GMAKE =		Yes
USE_LIBTOOL =		Yes
FAKE_FLAGS =		ELTCL_LIBRARY=${WRKINST}${MODTCL_TCLDIR}/eltcl

NO_REGRESS =		Yes

LIB_DEPENDS +=		${MODTK_LIB_DEPENDS}

WANTLIB +=		${MODTK_WANTLIB}

post-install:
	rm ${WRKINST}${MODTCL_TCLDIR}/eltcl/libeltclsh.la
	rm ${WRKINST}${MODTCL_TCLDIR}/eltcl/libeltclsh.a
	rm ${WRKINST}${MODTCL_TCLDIR}/pkgconfig/eltclsh.pc
	rmdir ${WRKINST}${MODTCL_TCLDIR}/pkgconfig

.include <bsd.port.mk>
