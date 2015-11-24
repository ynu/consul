#!/bin/bash

# 每个服务器都要安装的东西
sudo su

wget -q -O - "$@" http://git.io/vkiUF | bash

apt-get update

# 安装 supervisor
apt-get install -y supervisor

# 设置数据目录
cd / && mkdir data
cd /data && mkdir consul
chown wlzx consul
cd consul && mkdir -p data config

# 安装 consul

cd /tmp/

wget https://releases.hashicorp.com/consul/0.5.2/consul_0.5.2_linux_amd64.zip

unzip ./consul_0.5.2_linux_amd64.zip

cp consul /usr/bin

# 设置consul的supervisor配置文件
cd /etc/supervisor/conf.d
echo [program:consul] >> consul.conf
echo command=consul agent -config-dir=/data/consul/config >> consul.conf
echo user=wlzx >> consul.conf

exit