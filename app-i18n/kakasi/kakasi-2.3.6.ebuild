# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI=6

inherit eutils

DESCRIPTION="kanji kana simple inverter"
HOMEPAGE="http://kakasi.namazu.org/index.html.ja"
SRC_URI="http://kakasi.namazu.org/stable/${PN}-${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL"

SLOT=0
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sys-devel/automake sys-devel/make"
DEPEND="${RDEPEND}"

src_prepare() {
	default
}

src_compile() {
	econf || die "could not configure"
	emake || die "emake failed"
}


# use default implementation of src_install
