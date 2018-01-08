#!/bin/bash  

# echo 当前路径: `pwd`
# echo 参数个数: $#

file=`pwd`
isfile=false
isselect=false
mpath=""
empty=""

if [[ $# -eq 1 ]]; then
	mpath=$1
elif [[ $# -ge 2 ]]; then
	mpath=$2
	if [[ $1 -eq "-R" ]]; then
		isselect=true
	fi
fi

# echo mpath: $mpath

if [[ $# -ge 1 ]]; then

	c1=${mpath:0:1}
	c2=${mpath:1:1}

	# echo c1: $c1
	# echo c2: $c2

	s1="/"
	s2=":"

	if [ "$c1" = "$s1" ]; then
		file=$mpath
	elif [ "$c2" = "$s2" ]; then
		file=$mpath
	else
		file=${file}/${mpath}
	fi




fi


# 判断是否是文件
if [ -f "$file" ];then
	isfile=true
fi

c2=${file:1:1}
s2=":"
if [ "$c2" = "$s2" ]; then
	file=$file
else
	file=${file:1:1}:${file:2}
fi




file=${file//'/'/'\'};

# echo ===
# echo file: $file
# echo isfile: $isfile
# echo isselect: $isselect

if [[ $isselect == false && $isfile ]]; then
	# echo "Explorer.exe $file  11"
	Explorer.exe $file
elif [[ $isselect == false && $isfile == false ]]; then
	# echo "Explorer.exe $file  22"
	Explorer.exe $file
else
	# echo "Explorer.exe /select, $file"
	Explorer.exe /select,$file
fi