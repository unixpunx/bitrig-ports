# $OpenBSD: Makefile,v 1.1.1.1 2012/10/08 15:14:25 rpe Exp $

COMMENT=		quilt

DISTNAME=		quilt-0.60
CATEGORIES=		devel

HOMEPAGE=		http://savannah.nongnu.org/projects/quilt/

# GPLv3+
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=		c

MASTER_SITES= 		${MASTER_SITE_SAVANNAH:=quilt/}

MODULE=			devel/gettext

USE_GMAKE=		Yes

RUN_DEPENDS=		devel/gpatch \
			lang/gawk \
			mail/procmail \
			misc/findutils \
			misc/gnugetopt \
			shells/bash \
			sysutils/coreutils \
			sysutils/ggrep \
			textproc/diffstat \
			textproc/gdiff \
			textproc/gsed

BUILD_DEPENDS=		${RUN_DEPENDS}

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS=		--with-date=${LOCALBASE}/bin/gdate \
			--with-diff=${LOCALBASE}/bin/gdiff \
			--with-find=${LOCALBASE}/bin/gfind \
			--with-getopt=${LOCALBASE}/bin/gnugetopt \
			--with-grep=${LOCALBASE}/bin/ggrep \
			--with-patch=${LOCALBASE}/bin/gpatch \
			--with-sed=${LOCALBASE}/bin/gsed \
			--without-patch-wrapper \
			--without-rpmbuild


FAKE_FLAGS=		BUILD_ROOT=${WRKINST} \
			etcdir=${PREFIX}/share/examples/quilt

post-configure:
	${SUBST_CMD} ${WRKSRC}/test/delete.test
	
.include <bsd.port.mk>
