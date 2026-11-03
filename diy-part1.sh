#!/bin/sh
# diy-part1.sh - Orange Pi R1 Plus LTS, coolsnowwolf/lede
# 用法: 放到 lede 仓库根目录, GitHub Actions 里在 ./scripts/feeds update -a
# 之前跑一次 (同目录的 openwrt-ci.yml 里已经加了这一步);
# 本地编译同样在 feeds update 之前跑: sh diy-part1.sh
#
# 只做一件事: HomeProxy.
# immortalwrt/homeproxy 是单包仓库 (根目录就是 luci-app-homeproxy 的 Makefile),
# 不能当 feed 写进 feeds.conf.default, 只能克隆到 package/ 目录下,
# 编译系统扫描 package/*/Makefile 时自然会找到它.
# 它依赖 sing-box + firewall4 + kmod-nft-tproxy, .config 里都已选上.
set -e
rm -rf package/homeproxy
git clone --depth=1 https://github.com/immortalwrt/homeproxy.git package/homeproxy
ls package/homeproxy/Makefile
