# $OpenBSD: Makefile,v 1.3 2012/10/15 13:53:56 jasper Exp $

COMMENT=		jukebox frontend to mpd

MODPY_EGG_VERSION=	0.6.1
DISTNAME=		fookebox-${MODPY_EGG_VERSION}
REVISION=		1
CATEGORIES=		audio www

HOMEPAGE=		http://fookebox.googlecode.com/

# GPLv3
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=		${HOMEPAGE}/files/

MODULES=		lang/python
MODPY_SETUPTOOLS=	Yes
SUBST_VARS+=		MODPY_SITEPKG

BUILD_DEPENDS=		www/py-paste-script
RUN_DEPENDS=		audio/py-mpd \
			databases/py-sqlalchemy \
			devel/py-simplejson>=2.2.1 \
			www/py-formencode>=1.2.4 \
			www/py-paste-script \
			www/py-pylons>0.9.7 \
			www/py-routes>=1.12.3

NO_REGRESS=		Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/{doc,examples}/fookebox/
	${SUBST_CMD} ${WRKSRC}/docs/examples/apache/fookebox.wsgi
	rm ${WRKSRC}/docs/examples/apache/fookebox.wsgi.*
	${INSTALL_DATA} ${WRKSRC}/docs/examples/apache/* \
		${PREFIX}/share/examples/fookebox/
	${INSTALL_DATA} ${FILESDIR}/config.ini ${PREFIX}/share/examples/fookebox/
	${INSTALL_DATA} ${WRKSRC}/docs/config.txt ${PREFIX}/share/doc/fookebox/

.include <bsd.port.mk>
