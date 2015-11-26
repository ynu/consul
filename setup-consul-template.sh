#!/bin/bash

# 每个服务器都要安装的东西
sudo su

# 设置数据目录
cd /data && mkdir consul-template
chown -R wlzx /data/consul-template

# 安装consul template
cd /usr/bin
wget https://releases.hashicorp.com/consul-template/0.11.1/consul-template_0.11.1_linux_amd64.zip
yes | unzip consul-template_0.11.1_linux_amd64.zip
rm -f consul-template_0.11.1_linux_amd64.zip


# 设置consul template的supervisor配置文件
cd /etc/supervisor/conf.d/
echo [program:consul-template] >> consul-template.conf
echo command=consul-template -config /data/consul-template/config.hcl >> consul-template.conf

# 设置默认的consul template模板及配置文件
cd /data/consul-template
touch example.ct
echo 'consul = "10.0.2.15:8500"' >> config.hcl
echo 'token=""' >> config.hcl
echo 'template' { >> config.hcl
echo '	source = "/data/consul-template/example.ct"' >> config.hcl
echo '	destination = "/data/consul-template/example.conf"' >> config.hcl
echo } >> config.hcl

# 重新加载supervisor的配置
supervisorctl reload