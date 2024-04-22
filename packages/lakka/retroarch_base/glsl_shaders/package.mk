PKG_NAME="glsl_shaders"
PKG_VERSION="c943787317b22671165fed3abd6b459f6d15d8a9"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/glsl-shaders"
PKG_URL="${PKG_SITE}.git"
PKG_LONGDESC="Common GSLS shaders for RetroArch"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  make -C ${PKG_BUILD} install INSTALLDIR="${INSTALL}/usr/share/retroarch/shaders/GLSL-Shaders"
}
