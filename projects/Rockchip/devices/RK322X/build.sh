#!/bin/bash

#8 bit cores
LIBRETRO_CORES=" atari800 vice nestopia stella2014 cap32 vecx fuse sameboy handy freeintv o2em prosystem same_cdi bluemsx theodore"

#16 bit cores
LIBRETRO_CORES+=" hatari snes9x2010 picodrive puae "

#arcade
LIBRETRO_CORES+=" fbneo mame2003_plus mame2010 "

#32bit cores
LIBRETRO_CORES+=" pcsx_rearmed parallel_n64"

#standalone cores 
LIBRETRO_CORES+=" 2048 xrick tyrquake prboom ecwolf "

#fantasty cosnsole
LIBRETRO_CORES+=" tic80 "


CUSTOM_LIBRETRO_CORES=$LIBRETRO_CORES BUILDER_NAME=ilmich BUILD_PERIODIC=nightly PROJECT=Rockchip DEVICE=RK322X ARCH=arm UBOOT_SYSTEM=rk322x make image