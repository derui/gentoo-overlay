# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KEYWORDS="~amd64 ~x86"

inherit meson xdg-utils
HOMEPAGE="https://github.com/yshui/compton"
DESCRIPTION="Compton is a X compositing window manager, fork of xcompmgr-dana."

if [[ ${PV} != "9999" ]]; then
	SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="MPL-2.0 MIT"
SLOT="0"
IUSE="dbus drm +doc +libconfig +opengl +pcre python"

RDEPEND="
	dev-libs/libev
	>=x11-libs/libxcb-1.9.2
	x11-libs/libXext
	x11-libs/libXdamage
	x11-libs/libXrender
	x11-libs/libXrandr
	x11-libs/libXcomposite
	x11-libs/pixman
	x11-libs/xcb-util
	x11-libs/xcb-util-image
	x11-libs/xcb-util-renderutil
	dbus? ( sys-apps/dbus )
	drm? ( x11-libs/libdrm )
	libconfig? (
		>=dev-libs/libconfig-1.4:=
		dev-libs/libxdg-basedir
	)
	opengl? ( virtual/opengl )
	pcre? ( >=dev-libs/libpcre-8.20:3 )"
DEPEND="${RDEPEND}
	dev-libs/uthash"
BDEPEND="doc? ( app-text/asciidoc )"

src_configure() {
	# TODO: support FEATURES=test properly
	local emesonargs=(
		"$(meson_use dbus)"
		"$(meson_use doc build_docs)"
		"$(meson_use drm vsync_drm)"
		"$(meson_use libconfig config_file)"
		"$(meson_use opengl)"
		"$(meson_use pcre regex)"
	)
	meson_src_configure
}

src_install() {
	docinto examples
	dodoc compton-*-fshader-win.glsl compton.sample.conf bin/compton-convgen.py
	rm bin/compton-convgen.py

	meson_src_install
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}