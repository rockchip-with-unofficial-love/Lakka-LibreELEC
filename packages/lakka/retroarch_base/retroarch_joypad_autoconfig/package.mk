PKG_NAME="retroarch_joypad_autoconfig"
PKG_VERSION="4e1261f85d26bd235a0febaca083f592eb1da60f"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/retroarch-joypad-autoconfig"
PKG_URL="${PKG_SITE}.git"
PKG_LONGDESC="RetroArch joypad autoconfig files"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  make -C ${PKG_BUILD} install INSTALLDIR="${INSTALL}/etc/retroarch-joypad-autoconfig" DOC_DIR="${INSTALL}/etc/doc/."

  #Remove non tested joycon configs
  rm -f ${INSTALL}/etc/retroarch-joypad-autoconfig/udev/Nintendo\ -\ Switch\ Pro\ Controller\ \(bare\).cfg
  rm -f ${INSTALL}/etc/retroarch-joypad-autoconfig/udev/Nintendo\ -\ Switch\ Pro\ Controller.cfg
  rm -f ${INSTALL}/etc/retroarch-joypad-autoconfig/udev/Nintendo-Switch-Online_NES-Controller_Left.cfg
  rm -f ${INSTALL}/etc/retroarch-joypad-autoconfig/udev/Nintendo-Switch-Online_NES-Controller_Right.cfg
  
  #Place Working configs
  cp -Pr "${PKG_DIR}"/joypad_configs/* "${INSTALL}"/etc/retroarch-joypad-autoconfig/  

}

