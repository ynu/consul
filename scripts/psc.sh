#!/bin/bash

# process status check.
# updated on 2015/12/10 by na57

id=$(ps -C $1|grep $1|awk '{print $1}')

len=${#id}
if [ "$len" -gt 0 ]
then
	echo "running, pid: $id";
	exit 0;
else
	echo 'not running';
	exit 1;
fi