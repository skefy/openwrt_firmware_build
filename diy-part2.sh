#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate


# chage curl 8.6.0 to 8.5.0
# rm -rf feeds/packages/net/curl
# git clone https://github.com/sbwml/feeds_packages_net_curl feeds/packages/net/curl

# config git 
git config --global user.name "Leon"
git config --global user.email leon@gmail.com

# add i915
sudo mkdir /lib/firmware/i915
sudo curl -L https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/i915/tgl_dmc_ver2_12.bin -o /lib/firmware/i915/tgl_dmc_ver2_12.bin
echo 'CONFIG_FIRMWARE_IN_KERNEL=y' >> target/linux/x86/config-6.6
echo 'CONFIG_EXTRA_FIRMWARE="i915/tgl_dmc_ver2_12.bin"' >> target/linux/x86/config-6.6
echo 'CONFIG_EXTRA_FIRMWARE_DIR="/lib/firmware"' >> target/linux/x86/config-6.6

# 尝试解决openssl错误
# git revert 31ec451
# git add package/libs/openssl/Makefile
# git revert --continue --no-edit
rm -rf package/libs/openssl
cd ..
git clone --depth=1 https://github.com/istoreos/istoreos.git istoreos
cp -r istoreos/package/libs/openssl openwrt/package/libs/
