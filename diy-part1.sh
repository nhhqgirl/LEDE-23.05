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
sed -i '$a src-git gxnas https://github.com/gxnas/OpenWrt_Build_x64_Packages' feeds.conf.default
# 移除要替换的包
rm -rf feeds/packages/lang/golang
rm -rf feeds/packages/net/mosdns
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/luci/applications/luci-app-docker
rm -rf feeds/luci/applications/luci-app-dockerman
rm -rf package/feeds/gxnas/natflow
rm -rf package/feeds/gxnas/luci-app-dogcom

git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang




 
# 1-添加 PowerOff 插件
# git clone https://github.com/nhyoungboy/luci-app-poweroff.git package/luci-app-poweroff

# 2-添加 Mosdns 插件
# rm -rf feeds/packages/lang/golang
# rm -rf feeds/packages/net/mosdns
# rm -rf feeds/luci/applications/luci-app-mosdns
# git clone https://github.com/sbwml/luci-app-mosdns.git package/lean/luci-app-mosdns

# 3-添加 Openclash 插件
# wget -O package/openclash.zip https://codeload.github.com/vernesong/OpenClash/zip/refs/heads/master
# unzip -d package/openclash package/openclash.zip
# cp -r package/openclash/OpenClash-master/luci-app-openclash package/lean/luci-app-openclash
# rm -rf package/openclash package/openclash.zip

# 4-添加 onliner 插件
# sed -i '$a src-git onliner https://github.com/nhyoungboy/luci-app-onliner' feeds.conf.default

# 5-添加  主题
# rm -rf feeds/luci/themes/luci-theme-argon
# git clone https://github.com/sbwml/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
git clone --depth=1 https://github.com/nhyoungboy/luci-theme-opentomcat.git package/luci-theme-opentomcat


