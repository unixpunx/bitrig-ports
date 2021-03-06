# $OpenBSD: Makefile,v 1.215 2012/10/17 19:43:24 landry Exp $

COMMENT =	Mozilla web browser
BROKEN-sparc64 =	https://bugzilla.mozilla.org/show_bug.cgi?id=577056

# Don't forget to bump www/firefox-i18n after updates.
# Don't forget to update devel/xulrunner/2.0 if patches changes.

MOZILLA_VERSION =	16.0.1
MOZILLA_BRANCH =	release
MOZILLA_PROJECT =	firefox
MOZILLA_CODENAME =	browser
REVISION =	0

SO_VERSION =	35.0
# NOTE: Must bump minor version if any shlib's are removed from the
# components dir to avoid pkg_add -r issues.
MOZILLA_LIBS =	browsercomps mozalloc \
		xpcom xul

CATEGORIES =	www

# mozilla public license
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

# lots of logic in mozilla.port.mk
MODULES =	www/mozilla devel/gettext lang/python

MODPY_RUNDEP =	No

USE_GROFF =	Yes
# Regression tests are too hard to adapt to run here
NO_REGRESS =	Yes
SEPARATE_BUILD =	Yes

CC =    gcc
CXX =   g++

CONFIGURE_STYLE =	autoconf no-autoheader
CONFIGURE_ARGS +=	--enable-official-branding
CONFIGURE_ARGS +=	--with-system-libevent=/usr/ --disable-gconf
CONFIGURE_ARGS +=	--with-system-zlib=/usr/ --with-system-bz2=${LOCALBASE}
WANTLIB +=	event

MODGNU_CONFIG_GUESS_DIRS =	${WRKDIST}/build/autoconf \
				${WRKDIST}/ipc/chromium/src/third_party/libevent \
				${WRKDIST}/js/src/build/autoconf \
				${WRKDIST}/js/src/ctypes/libffi \
				${WRKDIST}/memory/jemalloc/src \
				${WRKDIST}/modules/freetype2/builds/unix \
				${WRKDIST}/nsprpub/build/autoconf \
				${WRKDIST}/toolkit/crashreporter/google-breakpad/autotools \
				${WRKDIST}/tools/profiler/libunwind/src/aux_ \
				${WRKDIST}/tools/profiler/libunwind/src/config

CONFIGURE_ARGS +=	--enable-gstreamer
LIB_DEPENDS +=	multimedia/gstreamer-0.10/plugins-base

WANTLIB += gmodule-2.0 gstapp-0.10 gstbase-0.10 gstreamer-0.10
WANTLIB += gstvideo-0.10 xml2

RUN_DEPENDS +=	multimedia/gstreamer-0.10/plugins-good

.if ${MACHINE_ARCH:Msparc64}
CONFIGURE_ARGS +=	--disable-tracejit --disable-methodjit
.endif

# XXX needed since 15.0b5, relocation overflow otherwise...
# replaces -g by -Os
.if ${MACHINE_ARCH} == "powerpc"
CONFIGURE_ENV +=	MOZ_DEBUG_FLAGS="-Os"
.endif

# needed during make install
BUILD_DEPENDS +=	archivers/unzip

# ensure we depend on cairo with tee backend enabled
LIB_DEPENDS +=	graphics/cairo>=1.10.2p0
# --with-system-png=${LOCALBASE}
# no system png : apng support not bundled in

MOZILLA_AUTOCONF_DIRS +=	js/src

post-install:
	${SUBST_CMD} -o ${SHAREOWN} -g ${SHAREGRP} -c ${FILESDIR}/mozilla-firefox.1 \
		${PREFIX}/man/man1/mozilla-firefox.1
	cd ${PREFIX}/man/man1/ && ln -sf mozilla-firefox.1 firefox.1
	cd ${PREFIX}/bin/ && ln -sf firefox mozilla-firefox
	# install desktop file
	${INSTALL_DATA_DIR} ${PREFIX}/share/applications/
	${SUBST_CMD} -o ${SHAREOWN} -g ${SHAREGRP} -c ${FILESDIR}/${MOZILLA_PROJECT}.desktop \
		${PREFIX}/share/applications/${MOZILLA_PROJECT}.desktop
	# install icon for desktop file
	${INSTALL_DATA_DIR} ${PREFIX}/share/pixmaps/
	${INSTALL_DATA} ${PREFIX}/lib/${MOZILLA_PROJECT}-${MOZILLA_VER}/icons/mozicon128.png \
		${PREFIX}/share/pixmaps/firefox.png

	# link default48.png to default.png to be used by default by non-icccm compliant wm
	ln ${PREFIX}/lib/firefox-${MOZILLA_VERSION:C/b.//}/chrome/icons/default/default{48,}.png

	# cleanup useless dirs from #717616
	rm -Rf ${PREFIX}/lib/firefox-${MOZILLA_VERSION:C/b.//}/js{sub,}loader


.include <bsd.port.mk>
