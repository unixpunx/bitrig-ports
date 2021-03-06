# $OpenBSD: Makefile,v 1.28 2012/09/15 10:43:40 sthen Exp $

COMMENT-main=	ISC DHCP Server
COMMENT-client=	ISC DHCP Client
COMMENT-omapi=	ISC DHCP OMAPI

VERSION=	4.2.4-P2
DISTNAME=	isc-dhcp-${VERSION}
PKGNAME=	isc-dhcp-${VERSION:S/-P/./}
PKGNAME-main=	isc-dhcp-server-${VERSION:S/-P/./}
PKGNAME-client=	isc-dhcp-client-${VERSION:S/-P/./}
PKGNAME-omapi=	isc-dhcp-omapi-${VERSION:S/-P/./}
CATEGORIES=	net

DISTFILES=	dhcp-${VERSION}.tar.gz
WRKDIST=	${WRKDIR}/dhcp-${VERSION}

MASTER_SITES=	${MASTER_SITE_ISC:=dhcp/${VERSION}/} \
		${MASTER_SITE_ISC:=dhcp/}

HOMEPAGE=	http://www.isc.org/software/dhcp/

MAINTAINER=	Jakob Schlyter <jakob@openbsd.org>

# ISC
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=		c

MULTI_PACKAGES=		-main -omapi -client

USE_GROFF=		Yes
USE_GMAKE=		Yes
CONFIGURE_STYLE=	gnu
MODGNU_CONFIG_GUESS_DIRS=	${WRKSRC}/ \
				${WRKSRC}/bind/bind-9.8.3/ \
				${WRKSRC}/bind/bind-9.8.3/unit/atf-src/

CONFIGURE_ARGS+= 	--enable-early-chroot \
			--enable-paranoia \

CC=			gcc

NO_REGRESS=		Yes

EXAMPLEDIR=		share/examples/isc-dhcp

pre-patch:
	cd ${WRKDIR}/dhcp-${VERSION}/bind && gunzip -c bind.tar.gz | tar xf -

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/${EXAMPLEDIR}
	${INSTALL_DATA} ${WRKSRC}/server/dhcpd.conf ${PREFIX}/${EXAMPLEDIR}
	${INSTALL_DATA} ${WRKSRC}/client/dhclient.conf ${PREFIX}/${EXAMPLEDIR}

.include <bsd.port.mk>
