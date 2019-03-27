# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI=6

inherit eutils

DESCRIPTION="Roswell - Common Lisp environment setup Utility"
HOMEPAGE="https://github.com/direnv/direnv"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT=0
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sys-devel/automake >=dev-lang/go-1.9"
DEPEND="${RDEPEND}"

src_prepare() {
	default
	sh ${S}/bootstrap || die "could not configure"
}

src_compile() {
	econf || die "could not configure"
	emake || die "emake failed"
}

# use default implementation of src_install
