# $OpenBSD: Makefile,v 1.10 2010/12/03 11:44:34 ajacoutot Exp $

COMMENT=	create dynamic PerlIO layers

MODULES=	cpan
DISTNAME=	PerlIO-via-dynamic-0.13
REVISION=	1
CATEGORIES=	devel
USE_GROFF =	Yes

MAINTAINER=	Kevin Lo <kevlo@openbsd.org>

# Artistic
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

RUN_DEPENDS=	devel/p5-Internals
BUILD_DEPENDS=	${RUN_DEPENDS}

.include <bsd.port.mk>
