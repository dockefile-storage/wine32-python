#!/usr/bin/env bash 

set -e  # 有错误就退出

## 设定 阿里dns
echo "nameserver 223.5.5.5"    >   /etc/resolv.conf  
echo "nameserver 223.6.6.6"    >>  /etc/resolv.conf

# 跟换国内源
grep "archive.ubuntu.com" /etc/apt/sources.list && \
sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/' /etc/apt/sources.list 
