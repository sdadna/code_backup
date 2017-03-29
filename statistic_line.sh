#!/bin/bash
#Description:statistic file and total lines
#./static_line.sh <path> <extention>
#eg.
#./static_line.sh . sh
#Date:2017/3/29
#Author:sdadna

TARGET_PATH=$1
EXTEND=$2

if [ "$TARGET_PATH" == "" ];then
	echo "path no exist"
	exit 1
fi

if [ "$EXTEND" == "" ];then
	exit "extend name is NULL"
	exit 1
fi

LINE_COUNT=`find $TARGET_PATH -name "*.$EXTEND"|xargs cat|wc -l`
FILE_COUNT=`find $TARGET_PATH -name "*.$EXTEND"|wc -l`


echo "$EXTEND file count: $FILE_COUNT"
echo "$EXTEND file line count:$LINE_COUNT"

