# $OpenBSD: Makefile,v 1.6 2011/04/10 18:58:31 jasper Exp $

COMMENT=	DBI driver for LDAP databases

MODULES=	cpan
USE_GROFF =	Yes

DISTNAME=	DBD-LDAP-0.20

CATEGORIES=	databases perl5

# perl
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	databases/p5-DBI \
		databases/p5-ldap

.include <bsd.port.mk>
