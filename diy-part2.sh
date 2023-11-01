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

##########################################
# update Xray-core and Xray-Plugin 
# https://github.com/immortalwrt/packages
# #########################################

# ==> XRay-core : https://github.com/XTLS/Xray-core
# ==> XRay-plugin : https://github.com/teddysun/xray-plugin/
sed -i 's/^PKG_VERSION:=.*/PKG_VERSION:=1.8.4/' feeds/packages/net/xray-core/Makefile
sed -i 's/^PKG_HASH:=.*/PKG_HASH:=89f73107abba9bd438111edfe921603ddb3c2b631b2716fbdc6be78552f0d322/' feeds/packages/net/xray-core/Makefile

sed -i 's/^PKG_VERSION:=.*/PKG_VERSION:=1.8.4/' feeds/packages/net/xray-plugin/Makefile
sed -i 's/^PKG_HASH:=.*/PKG_HASH:=78c9c7f3e049d555b68914b545224cb9fd8253b75fe797a62a54b6e9af0bf870/' feeds/packages/net/xray-plugin/Makefile


### update V2ray-core and V2ray-Plugin
# ==> v2ray-core : https://github.com/v2fly/v2ray-core
# ==> v2ray-plugin : https://github.com/teddysun/v2ray-plugin
sed -i 's/^PKG_VERSION:=.*/PKG_VERSION:=5.10.1/' feeds/packages/net/v2ray-core/Makefile
sed -i 's/^PKG_HASH:=.*/PKG_HASH:=dfa0f9d6d1297819567cedad525025d2a6db07a1553213f2ecb2de110918c07c/' feeds/packages/net/v2ray-core/Makefile

sed -i 's/^PKG_VERSION:=.*/PKG_VERSION:=5.10.0/' feeds/packages/net/vv2ray-plugin/Makefile
sed -i 's/^PKG_HASH:=.*/PKG_HASH:=2ff37018e8bb6e9208206e84b9b5be77ad3d9a9e62bf2078b871f4f7066a87b8/' feeds/packages/net/vv2ray-plugin/Makefile
