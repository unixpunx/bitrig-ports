# $OpenBSD: Makefile,v 1.1.1.1 2012/03/20 16:34:07 naddy Exp $

COMMENT =		file, shell and text manipulation utilities
DISTNAME =		coreutils-8.15

CATEGORIES =		sysutils

HOMEPAGE =		http://www.gnu.org/software/coreutils/coreutils.html

# GPLv3+
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

WANTLIB =		c pthread

MASTER_SITES =		${MASTER_SITE_GNU:=coreutils/}
EXTRACT_SUFX =		.tar.xz

MODULES =		devel/gettext

MODGNU_CONFIG_GUESS_DIRS=${WRKSRC}/build-aux

CONFIGURE_STYLE =	gnu
CONFIGURE_ARGS =	--program-prefix=g \
			--without-gmp

# Prevent conflicts with: id, gpr and god
post-install:
.for I in gid god gpr
	mv "${PREFIX}/bin/$I" "${PREFIX}/bin/g$I"
	mv "${PREFIX}/man/man1/$I.1" "${PREFIX}/man/man1/g$I.1"
.endfor

.include <bsd.port.mk>
