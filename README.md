# consul
数据中心Consul配置

## 数据中心服务器安装脚本

### 更换最快的源
`sudo wget -q -O - "$@" http://git.io/vkiUF | bash`

### 基础软件安装
`sudo wget -q -O - "$@" https://raw.githubusercontent.com/ynu/consul/master/setup-base.sh | bash`

脚本进行的操作包括：
- 更换最快的源
- 安装supervisor
- 设置data目录，包括consul、nginx子目录
- 安装consul
- 设置consul在supervisor中的配置文件
- 添加nginx、haproxy、rabbitmq-server的PPA

### consul-template 安装
`sudo wget -q -O - "$@" https://raw.githubusercontent.com/ynu/consul/master/setup-consul-template.sh | bash`

脚本进行的操作包括：
- 在dafa目录中设置consul-template的目录
-  安装consul-template
-  设置consul-template在supervisor中的配置文件
-  设置基本的配置文件及模板文件

### 安装MongoDB
`sudo wget -q -O - "$@" https://raw.githubusercontent.com/ynu/consul/master/setup-mongodb.sh | bash`
