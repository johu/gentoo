# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_REMOVE_MODULES_LIST=( FindCurses )
inherit cmake

DESCRIPTION="Interactive memory viewer"
HOMEPAGE="https://bitbucket.org/PascalRD/memwatch"
SRC_URI="https://unixdev.ru/src/${P}.tar.gz"

LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS="~amd64 ~riscv ~x86"

DEPEND="sys-libs/ncurses:0="
RDEPEND="${DEPEND}"

PATCHES=(
	"$FILESDIR"/${P}-cflags.patch
	"$FILESDIR"/${P}-cmake4.patch
)
