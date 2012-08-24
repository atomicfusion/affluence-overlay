# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit cmake-utils

DESCRIPTION=""
HOMEPAGE=""
if [ "$PV" = "9999" ]; then
        inherit git-2
        EGIT_REPO_URI="https://github.com/atomicfusion/${PN}.git"
else
        SRC_URI=""
fi

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="" 

src_install() {
        cmake-utils_src_install
	newinitd "${FILESDIR}/${PVR}-initscript" "${PN}"
	newconfd "${FILESDIR}/${PVR}-initconf" "${PN}"
	newenvd "${FILESDIR}/${PVR}-env" "10${PN}"
}
