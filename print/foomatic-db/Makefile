# $OpenBSD: Makefile,v 1.25 2012/10/19 08:15:41 ajacoutot Exp $

PKG_ARCH=		*

COMMENT=		Foomatic PPD data

V=			20120901
DISTNAME=		foomatic-db-4.0-${V}
PKGNAME=		foomatic-db-4.0.${V}
REVISION=		0

CATEGORIES=		print

HOMEPAGE=		http://www.linux-foundation.org/en/OpenPrinting/Database/Foomatic

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv2 - MIT
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

# tarballs are only available for a 24 hour period
#MASTER_SITES=		http://www.openprinting.org/download/foomatic/ \
#			http://www.openprinting.org/download/foomatic/oldstuff/
MASTER_SITES=		http://distfiles.bsdfrog.org/

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS=		--disable-ppds-to-cups

WRKDIST=		${WRKDIR}/foomatic-db-${V}

# share/foomatic/db/source/*/*.xml
RUN_DEPENDS +=		print/foomatic-db-engine

NO_BUILD=		Yes
NO_REGRESS=		Yes

pre-configure:
	${SUBST_CMD} ${WRKSRC}/configure

# From Fedora ; these files are already shipped by the foo2zjs package
# RH #208851 #438319 #518267
.for x in zjs oak-z1 oak hp qpdl lava kyo xqx slx hiperc
	find ${WRKSRC}/db/source/printer -name '*.xml' | xargs grep -l "<driver>foo2${x}" | xargs rm
	rm -f ${WRKSRC}/db/source/driver/foo2${x}.xml \
		${WRKSRC}/db/source/opt/foo2${x}-*
.endfor
	rm ${WRKSRC}/db/source/printer/KONICA_MINOLTA-magicolor_2430_DL.xml
.for i in Xerox-Phaser_6110 Samsung-CLP-300 Samsung-CLP-310 Samsung-CLP-315
	mv ${WRKSRC}/db/source/printer/${i}.xml \
		${WRKSRC}/db/source/printer/${i}-splix.xml
.endfor
# files already shipped by the ptouch-driver package
	rm -f ${WRKSRC}/db/source/printer/Brother-{PT,QL}*.xml
	rm -f ${WRKSRC}/db/source/driver/ptouch.xml

.include <bsd.port.mk>
