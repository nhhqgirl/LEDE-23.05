# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add openwrt-packages
git clone --depth=1 https://github.com/xuanranran/openwrt-package openwrt-package
git clone --depth=1 https://github.com/xuanranran/rely openwrt-rely
git clone --depth=1 https://github.com/immortalwrt/wwan-packages wwan-packages
chmod 755 openwrt-package/luci-app-onliner/root/usr/share/onliner/setnlbw.sh
popd

# fix sysupgrade
rm -rf package/base-files/files/sbin/sysupgrade
cp -f $GITHUB_WORKSPACE/data/sysupgrade package/base-files/files/sbin/sysupgrade
chmod 755 package/base-files/files/sbin/sysupgrade

# Change default shell to zsh
sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# Modify default IP
sed -i 's/192.168.1.1/192.168.81.1/g' package/base-files/files/bin/config_generate

# 修改开源站地址
# sed -i '/@OPENWRT/a\\t\t"https://source.cooluc.com",' scripts/projectsmirrors.json

sed -i 's/services/network/g' customfeeds/luci/applications/luci-app-upnp/root/usr/share/luci/menu.d/luci-app-upnp.json

# Test kernel 6.6
rm -rf target/linux/x86/base-files/etc/board.d/02_network
cp -f $GITHUB_WORKSPACE/data/02_network target/linux/x86/base-files/etc/board.d/02_network
