git clone --depth=1 https://github.com/xuanranran/openwrt-package customfeeds/lovepackages
git clone --depth=1 https://github.com/xuanranran/rely customfeeds/loverely
git clone --depth=1 https://github.com/immortalwrt/packages -b $REPO_BRANCH customfeeds/packages
git clone --depth=1 https://github.com/immortalwrt/luci -b $REPO_BRANCH customfeeds/luci
git clone --depth=1 https://github.com/openwrt/routing -b $REPO_BRANCH customfeeds/routing
git clone --depth=1 https://github.com/openwrt/telephony -b $REPO_BRANCH customfeeds/telephony


