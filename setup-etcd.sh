#!/bin/bash

# 每个服务器都要安装的东西
sudo su

cd /tmp/
curl -L  https://github.com/coreos/etcd/releases/download/v2.2.2/etcd-v2.2.2-linux-amd64.tar.gz -o etcd-v2.2.2-linux-amd64.tar.gz
tar xzvf etcd-v2.2.2-linux-amd64.tar.gz
cp etcd-v2.2.2-linux-amd64/etcd /usr/bin
cp etcd-v2.2.2-linux-amd64/etcdctl /usr/bin
rm -f etcd-v2.2.2-linux-amd64.tar.gz
rm -rf etcd-v2.2.2-linux-amd64

# 设置etcd的supervisor配置文件
cd /etc/supervisor/conf.d/
echo '[program:etcd] >> etcd.conf'
echo 'command=/usr/bin/etcd >> etcd.conf'

supervisorctl reload