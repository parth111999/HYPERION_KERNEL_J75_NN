#!/bin/bash
DTS=arch/arm64/boot/dts
RDIR=$(pwd)
# GCC
export CROSS_COMPILE=/home/prashantp/aarch64-linux-android-4.9/bin/aarch64-linux-android-
# Cleanup
make clean && make mrproper
# J700F NN Defcon
make j7elte_00_defconfig
make exynos7580-j7elte_rev00.dtb exynos7580-j7elte_rev04.dtb exynos7580-j7elte_rev06.dtb
# Make zImage
make ARCH=arm64 -j5
# Make DT.img
./tools/dtbtool -o ./boot.img-dtb -v -s 2048 -p ./scripts/dtc/ $DTS/
# Cleaup
rm -rf $DTS/.*.tmp
rm -rf $DTS/.*.cmd
rm -rf $DTS/*.dtb
