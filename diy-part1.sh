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

# 移除旧包
rm -rf feeds/packages/lang/golang/golang
rm -rf feeds/packages/net/mosdns
rm -rf feeds/luci/applications/luci-app-dockerman
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/rely/luci-app-openclash
rm -rf feeds/xuanranran/luci-app-openclash
rm -rf feeds/xuanranran/luci-app-poweroff



 
# 添加 PowerOff 插件
git clone https://github.com/nhyoungboy/luci-app-poweroff.git package/luci-app-poweroff




