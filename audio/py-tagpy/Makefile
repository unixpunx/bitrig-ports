# $OpenBSD: Makefile,v 1.11 2012/10/04 09:17:31 dcoppa Exp $

COMMENT=		Python bindings to TagLib audio file tag library

MODPY_EGG_VERSION =	0.94.8
DISTNAME =		tagpy-${MODPY_EGG_VERSION}
PKGNAME =		py-${DISTNAME}
REVISION =		1

CATEGORIES =		audio devel

HOMEPAGE =		http://mathema.tician.de/software/tagpy

# MIT
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP =	Yes

WANTLIB += boost_python-mt m pthread stdc++ tag>=10 ${MODPY_WANTLIB}

MASTER_SITES =		${MASTER_SITE_PYPI:=t/tagpy/}

VMEM_WARNING=		Yes

MODULES =		lang/python
MODPY_SETUPTOOLS =	Yes

LIB_DEPENDS =		${MODPY_LIB_DEPENDS} \
			audio/taglib>=1.8 \
			devel/boost

CONFIGURE_ARGS +=	--boost-python-libname=boost_python-mt \
			--boost-compiler=gcc42 \
			--boost-lib-dir=${LOCALBASE}/lib \
			--boost-inc-dir=${LOCALBASE}/include \
			--taglib-lib-dir=${LOCALBASE}/lib \
			--taglib-inc-dir=${LOCALBASE}/include/taglib \

do-configure:
		cd ${WRKSRC} && env ${CONFIGURE_ENV} ${MODPY_BIN} ./configure.py ${CONFIGURE_ARGS}

.include <bsd.port.mk>
