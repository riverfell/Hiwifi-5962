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
sed -i 's/192.168.1.1/192.168.0.1/g' package/base-files/files/bin/config_generate

# Modify timezone
sed -i '/CST-8/a\\t\tset system.@system[-1].zonename=Asia/Shanghai' package/base-files/files/bin/config_generate
sed -i "s#Asia/Shanghai#'Asia/Shanghai'#g" package/base-files/files/bin/config_generate

# Change defalut theme
sed -i "s/bootstrap/argon/g" feeds/luci/collections/luci/Makefile

# 修改连接数
echo "net.netfilter.nf_conntrack_max= 65535" >> package/base-files/files/etc/sysctl.conf
