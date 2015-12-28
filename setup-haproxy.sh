#!/bin/bash

apt-get install -y python-software-properties

# 添加haproxy的PPA
add-apt-repository ppa:vbernat/haproxy-1.5

apt-get update

apt-get install -y haproxy