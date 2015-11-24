#!/bin/bash

# 每个服务器都要安装的东西
sudo su

wget -q -O - "$@" http://git.io/vkiUF | bash

apt-get update

# 安装 supervisor, python-software-properties
apt-get install -y supervisor python-software-properties



# 设置数据目录
cd / && mkdir data
cd /data && mkdir -p consul nginx
cd consul && mkdir -p data config

cd /data/nginx && mkdir log

chown -R wlzx /data

# 安装 consul

cd /usr/bin

wget https://releases.hashicorp.com/consul/0.5.2/consul_0.5.2_linux_amd64.zip

yes | unzip ./consul_0.5.2_linux_amd64.zip

rm -f consul_0.5.2_linux_amd64.zip

# 设置consul的supervisor配置文件
cd /etc/supervisor/conf.d
echo [program:consul] >> consul.conf
echo command=consul agent -config-dir=/data/consul/config >> consul.conf
echo user=wlzx >> consul.conf

# 添加nginx的PPA
add-apt-repository ppa:nginx/stable


# 添加haproxy的PPA
add-apt-repository ppa:vbernat/haproxy-1.5

apt-get update


exit