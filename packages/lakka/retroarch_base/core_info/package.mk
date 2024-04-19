PKG_NAME="core_info"
PKG_VERSION="a14d7eb60908def60fc422f689f34b0c2f63c58e"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/libretro-core-info"
PKG_URL="${PKG_SITE}.git"
PKG_LONGDESC="Info files for libretro cores"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  make -C ${PKG_BUILD} install INSTALLDIR="${INSTALL}/usr/lib/libretro"

  # ScummVM package provides own core info file
  rm -f ${INSTALL}/usr/lib/libretro/scummvm_libretro.info
}
