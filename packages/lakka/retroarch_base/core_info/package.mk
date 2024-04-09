PKG_NAME="core_info"
PKG_VERSION="a59bb4dfe97502d5547ee3a242f1ac01b550bfa4"
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
