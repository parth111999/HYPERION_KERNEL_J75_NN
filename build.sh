#!/bin/bash
DTS=arch/arm64/boot/dts
RDIR=$(pwd)
# GCC
export CROSS_COMPILE=/home/prashantp/aarch64-linux-android-4.9/bin/aarch64-linux-android-
# Cleanup
make clean && make mrproper
# J700F NN Defcon
make j7eltetmo_00_defconfig
make dtb exynos7580-universal7580.dtb exynos7580-universal7580_rev02.dtb exynos7580-universal7580_q.dtb
# Make zImage
make ARCH=arm64 -j5
# Make DT.img
./tools/dtbtool -o ./boot.img-dtb -v -s 2048 -p ./scripts/dtc/ $DTS/
# Cleaup
rm -rf $DTS/.*.tmp
rm -rf $DTS/.*.cmd
rm -rf $DTS/*.dtb
