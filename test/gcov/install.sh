#!/bin/bash


ipa=$1


if [ "$ipa" = "" ]; then
	echo "请设定ipa文件"
	exit
fi

if [ -e $ipa ]; then

	i=0
	for line in $(system_profiler SPUSBDataType | sed -n -e '/iPad/,/Serial/p' -e '/iPhone/,/Serial/p' | grep "Serial Number:" | awk -F ": " '{print $2}'); do
	   UDID=${line}
	   echo $i : $UDID
	   udid_array[i]=${line}
	   i=$(($i+1))
	done
	cnt=${#udid_array[@]}
	
	echo -n "请选择设备deviceid,默认为0:"
	read index
	if [[ $index < $cnt ]]; then
		unzip -qq $ipa
		./fruitstrap -b Payload/LAPushDemoTest.app ${udid_array[index]}
		rm -rf Payload
	else
		echo "请选择正确的设备id"
	fi
	
	
else
	echo "安装(ipa)文件不存在"
fi
