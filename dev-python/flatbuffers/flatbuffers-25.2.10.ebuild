# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="RFC 7049 - Concise Binary Object Representation"
HOMEPAGE="
	https://github.com/google/flatbuffers/
	https://pypi.org/project/flatbuffers/
"
SRC_URI="
	https://github.com/google/${PN}/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"
S=${WORKDIR}/${P}/python

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 ~riscv ~sparc x86"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="
	test? (
		dev-python/numpy[${PYTHON_USEDEP}]
	)
"

src_prepare() {
	cd "${WORKDIR}/${P}" || die
	eapply "${FILESDIR}/${PN}-24.3.25-numpy-2.patch"
	cd "${S}" || die
	distutils-r1_src_prepare
}

python_test() {
	cd "${WORKDIR}/${P}/tests" || die
	# zeroes means without benchmarks
	"${EPYTHON}" py_test.py 0 0 0 0 false || die
	"${EPYTHON}" py_flexbuffers_test.py -v || die
}
