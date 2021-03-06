# $OpenBSD: Makefile,v 1.2 2012/10/11 17:59:05 sthen Exp $

COMMENT=	lightweight DLNA/UPnP-AV media server

V=		1.0.25
REVISION=	0
DISTNAME=	minidlna_$V_src
WRKDIST=	${WRKDIR}/minidlna-$V
PKGNAME=	minidlna-$V

CATEGORIES=	multimedia

MAINTAINER=	Stuart Henderson <sthen@openbsd.org>

HOMEPAGE=	http://sourceforge.net/projects/minidlna/

# GPLv2 only
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB += FLAC avcodec avformat avutil c exif id3tag jpeg ogg
WANTLIB += pthread sqlite3 vorbis

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=minidlna/}

MODULES=	devel/gettext
LIB_DEPENDS=	audio/flac \
		audio/libid3tag \
		graphics/ffmpeg \
		graphics/jpeg \
		graphics/libexif

MAKE_FLAGS=	CC="${CC}" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" \
		INSTALLPREFIX="${WRKINST}${TRUEPREFIX}"
CFLAGS+=	-Wall -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 \
		-I${LOCALBASE}/include \
		-I${LOCALBASE}/include/libavcodec \
		-I${LOCALBASE}/include/libavformat \
		-I${LOCALBASE}/include/libavutil
LDFLAGS=	-L${LOCALBASE}/lib

NO_REGRESS=	Yes
E=		${PREFIX}/share/examples/minidlna

do-configure:
	@cd ${WRKSRC} && perl -pi -e 's,/usr/local,${LOCALBASE},g' genconfig.sh

post-install:
	${INSTALL_DATA_DIR} $E
	${INSTALL_DATA} ${WRKSRC}/minidlna.conf $E

.include <bsd.port.mk>
