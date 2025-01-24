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

# 添加 onliner 插件
git clone https://github.com/nhhqgirl/luci-app-onliner.git package/lean/luci-app-onliner

# 添加 PowerOff 插件
# git clone https://github.com/nhhqgirl/luci-app-poweroff.git package/lean/luci-app-poweroff

# 添加 opentomcat 主题
# git clone --depth=1 https://github.com/nhyoungboy/luci-theme-opentomcat.git package/lean/luci-theme-opentomcat

# 添加 argon 主题
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
