# $OpenBSD: Makefile,v 1.3 2012/09/02 21:14:02 kili Exp $

COMMENT =		Haskell 98 contravariant functors

DISTNAME =		contravariant-0.2.0.2
CATEGORIES =		devel

# BSD3
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MODULES =		lang/ghc

MODGHC_BUILD =		cabal hackage haddock register

RUN_DEPENDS =		devel/hs-transformers>=0.2,<0.4
BUILD_DEPENDS =		${RUN_DEPENDS}

.include <bsd.port.mk>
