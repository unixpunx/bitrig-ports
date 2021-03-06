# $OpenBSD: Makefile,v 1.36 2012/10/19 09:34:48 ajacoutot Exp $

COMMENT=	driver for ZjStream wire protocol compatible printers

VERSION=	20120909
DISTNAME=	foo2zjs-${VERSION}

REVISION=	0

CATEGORIES=	print

HOMEPAGE=	http://foo2zjs.rkkda.com/

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += c cups m pthread

MASTER_SITES=	http://distfiles.bsdfrog.org/

USE_GMAKE=	Yes

WRKDIST=	${WRKDIR}/foo2zjs

BUILD_DEPENDS=	print/ghostscript/gnu # ps2pdf

LIB_DEPENDS=	print/cups,-libs

# share/foomatic/db/source/*/*.xml
RUN_DEPENDS +=	print/foomatic-db-engine

MAKE_FLAGS+=	CUPS_SERVERBIN=`cups-config --serverbin`

NO_REGRESS=	Yes

post-patch:
	ln -sf ${WRKSRC}/modify-ppd ${WRKDIR}/bin/modify-ppd

pre-configure:
	perl -pi -e 's,/usr/bin,${PREFIX}/bin,g' \
		${WRKSRC}/*.1in
	perl -pi -e 's,\$\(shell ,\$\(,g' ${WRKSRC}/{,icc2ps}/Makefile
	${SUBST_CMD} ${WRKSRC}/getweb.in

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/{getweb,msexpand} \
		${PREFIX}/share/doc/foo2zjs
	${INSTALL_DATA_DIR} ${PREFIX}/libexec/cups/filter
	ln -sf ${TRUEPREFIX}/bin/command2foo2lava-pjl \
		${WRKINST}/${LOCALBASE}/libexec/cups/filter/

.include <bsd.port.mk>
