# $OpenBSD: Makefile,v 1.20 2012/10/09 09:22:24 dcoppa Exp $

COMMENT =	OCaml interface to GTK+2

V =		2.16.0
DISTNAME =	lablgtk-$V
PKGNAME =	lablgtk2-$V
CATEGORIES =	x11 devel

HOMEPAGE =	http://lablgtk.forge.ocamlcore.org/
MASTER_SITES =	https://forge.ocamlcore.org/frs/download.php/979/

# LGPL
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

WANTLIB =	GL X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi \
		Xinerama Xrandr Xrender atk-1.0 cairo expat \
		fontconfig freetype gdk-x11-2.0 gdk_pixbuf-2.0 \
		gio-2.0 glade-2.0 glib-2.0 gobject-2.0 \
		gtk-x11-2.0 gtksourceview-2.0 m pango-1.0 \
		pangocairo-1.0 pangoft2-1.0 pixman-1 png \
		pthread-stubs rsvg-2 xcb xcb-render xcb-shm xml2 z

BUILD_DEPENDS =	sysutils/findlib

LIB_DEPENDS =	x11/gtk+2 \
		devel/libglade2 \
		x11/gtksourceview \
		x11/gnome/librsvg

FAKE_FLAGS =	BINDIR=${WRKINST}${PREFIX}/bin \
		INSTALLDIR=${WRKINST}${PREFIX}/lib/ocaml/lablgtk2 \
		DLLDIR=${WRKINST}${PREFIX}/lib/ocaml/stublibs

USE_GMAKE =	Yes
MODULES =	lang/ocaml \
		devel/gettext

CONFIGURE_STYLE =	gnu
CONFIGURE_ARGS =	USE_CC=1 ${MODOCAML_NATIVE:S/Yes/USE_DOTOPT=1/:S/No//} \
		--without-gl --without-panel \
		--without-gnomecanvas --without-gnomeui --without-gtksourceview \
		--without-gtkspell --without-quartz

ALL_TARGET =	all ${MODOCAML_NATIVE:S/Yes/opt/:S/No//}

NO_REGRESS =	Yes

post-install:
		chown -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/lib/ocaml/lablgtk2
		${INSTALL_DATA_DIR} ${PREFIX}/share/doc/lablgtk2
		${INSTALL_DATA} ${WRKDIST}/README ${PREFIX}/share/doc/lablgtk2
		${INSTALL_DATA_DIR} ${PREFIX}/lib/ocaml/site-lib/lablgtk2
		${INSTALL_DATA} ${WRKSRC}/META ${PREFIX}/lib/ocaml/site-lib/lablgtk2

.include <bsd.port.mk>
