# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A lightweight decompression library with support for rar, tar and zip archives"
HOMEPAGE="http://github.com/selmf/unarr"
SRC_URI="https://github.com/selmf/${PN}/releases/download/v${PV}/${P}.tar.xz"
KEYWORDS="~x86 ~amd64 ~arm"

LICENSE="LGPL-3"
SLOT="0"
IUSE=""

DEPEND="
	sys-libs/zlib
	app-arch/bzip2
	app-arch/xz-utils
"
RDEPEND="${DEPEND}"
