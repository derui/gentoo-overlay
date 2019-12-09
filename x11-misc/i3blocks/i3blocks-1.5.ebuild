# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="highly flexible status line for the i3 window manager"
HOMEPAGE="https://github.com/vivien/i3blocks"
SRC_URI="https://github.com/vivien/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 ~arm64 x86"

SLOT="0"
LICENSE="GPL-3"

RDEPEND=">=app-shells/bash-completion-2.0
         || ( x11-wm/i3 x11-wm/i3-gaps )"

DEPEND="app-text/ronn"

src_configure() {
    eautoreconf
    econf
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
}
