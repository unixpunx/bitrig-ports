# $OpenBSD: Makefile,v 1.12 2012/10/11 13:31:28 dcoppa Exp $

COMMENT =	command-line interface for Cabal and Hackage

DISTNAME =	cabal-install-0.14.0
REVISION =	0
CATEGORIES =	devel

HOMEPAGE =	http://www.haskell.org/cabal/

MAINTAINER =	Matthias Kilian <kili@openbsd.org>

# BSD3
PERMIT_PACKAGE_CDROM =		Yes
PERMIT_PACKAGE_FTP =		Yes
PERMIT_DISTFILES_CDROM =	Yes
PERMIT_DISTFILES_FTP =		Yes

WANTLIB =		c m pthread util z

MODULES =		lang/ghc converters/libiconv
MODGHC_BUILD =          cabal hackage nort

BUILD_DEPENDS +=	devel/hs-mtl>=2.0,<3 \
			devel/hs-network>=1,<3 \
			devel/hs-random>=1,<1.1 \
			net/hs-HTTP>=4000.0.2,<4001 \
			archivers/hs-zlib>=0.4,<0.6

.include <bsd.port.mk>
