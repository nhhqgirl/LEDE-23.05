#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

#sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.10/g' ./target/linux/x86/Makefile

# 1-添加 PowerOff 插件
git clone https://github.com/WukongMaster/luci-app-poweroff.git package/luci-app-poweroff

# 2-添加 Mosdns 插件
# git clone --depth=1 https://github.com/sbwml/luci-app-mosdns package/luci-app-mosdns

# drop mosdns and v2ray-geodata packages that come with the source
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f

git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
make menuconfig # choose LUCI -> Applications -> luci-app-mosdns
make package/mosdns/luci-app-mosdns/compile V=s

# 3-添加 Openclash 插件
wget -O package/openclash.zip https://codeload.github.com/vernesong/OpenClash/zip/refs/heads/master
unzip -d package/openclash package/openclash.zip
cp -r package/openclash/OpenClash-master/luci-app-openclash package/lean/luci-app-openclash
rm -rf package/openclash package/openclash.zip

# 3-添加 argon 主题
rm -rf feeds/luci/themes/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon


