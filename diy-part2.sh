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

# rm -rf feeds/luci/applications/luci-app-mosdns 
# rm -rf feeds/packages/net/mosdns
# rm -rf feeds/packages/net/v2dat
# rm -rf feeds/packages/net/v2ray-geodata

# 修改网络设置
sed -i 's/192.168.1.1/192.168.81.1/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.81.1/g' package/base-files/luci2/bin/config_generate


# Change default theme
sed -i 's#luci-theme-bootstrap#luci-theme-opentomcat#g' feeds/luci/collections/luci/Makefile
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# x86 型号只显示 CPU 型号
sed -i 's/${g}.*/${a}${b}${c}${d}${e}${f}${hydrid}/g' package/lean/autocore/files/x86/autocore

# 修改本地时间格式
sed -i 's/os.date()/os.date("%a %Y-%m-%d %H:%M:%S")/g' package/lean/autocore/files/*/index.htm

# 修改版本为编译日期
date_version=$(date +"%y.%m.%d")
orig_version=$(cat "package/lean/default-settings/files/zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
sed -i "s/${orig_version}/R${date_version} by LERAN/g" package/lean/default-settings/files/zzz-default-settings

# 创建OpenClash使用的clash二进制文件所在的路径
# mkdir -p files/etc/openclash/core
# 下载[Meta] 当前内核版本
#  CLASH_META_URL=$( curl -sL https://api.github.com/repos/vernesong/OpenClash/contents/dev/meta?ref=core | grep meta/clash-linux-amd64.tar.gz | awk -F '"' '{print $4}' | awk 'NR==4{print}' )
# wget -qO- $CLASH_META_URL | tar xOvz > files/etc/openclash/core/clash_meta
# 下载默认IP相关数据
# wget -qO- https://cdn.jsdelivr.net/gh/alecthw/mmdb_china_ip_list@release/Country.mmdb > files/etc/openclash/Country.mmdb
# wget -qO- https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat > files/etc/openclash/GeoIP.dat
# wget -qO- https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat > files/etc/openclash/GeoSite.dat
# 给Clash二进制文件增加执行权限
# chmod +x files/etc/openclash/core/clash*
