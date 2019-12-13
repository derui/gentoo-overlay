# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Outputs X window titles"
HOMEPAGE="https://github.com/baskerville/xtitle"
SRC_URI="https://github.com/baskerville/xtitle/archive/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64"

SLOT="0"
LICENSE="Unilicense"

RDEPEND="x11-base/libxcb"
S=${WORKDIR}/xtitle-${PV}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
}
