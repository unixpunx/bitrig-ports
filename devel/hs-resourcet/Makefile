# $OpenBSD: Makefile,v 1.1.1.1 2012/08/30 20:53:14 kili Exp $

COMMENT =		deterministic allocation and freeing of scarce resources

DISTNAME =		resourcet-0.3.3.1
CATEGORIES =		devel

MAINTAINER =		Matthias Kilian <kili@openbsd.org>

# BSD3
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MODULES =		lang/ghc

MODGHC_BUILD =		cabal hackage haddock register

BUILD_DEPENDS =		${RUN_DEPENDS}

RUN_DEPENDS =		devel/hs-lifted-base>=0.1,<0.2 \
			devel/hs-monad-control>=0.3.1,<0.4 \
			devel/hs-mtl>=2.0,<2.2 \
			devel/hs-transformers>=0.2.2,<0.4 \
			devel/hs-transformers-base>=0.4.1,<0.5

.include <bsd.port.mk>
