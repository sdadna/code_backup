#!/bin/bash
#Description:statistic total file and total lines in one path
#./static_line.sh <path>
#eg.
#./static_line.sh . 
#Date:2017/3/29
#Author:sdadna


EXTEND_ARRAY=(c h sh java go cpp py)

SUM_LINE=0
SUM_FILE=0
#TARGET_PATH=$1

function statistic () {

	if [ "$1" == "" ];then
		echo "path no exist"
		exit 1
	fi

	if [ "$2" == "" ];then
		exit "extend name is NULL"
		exit 1
	fi

	FILE_COUNT=`find $1 -name "*.$2"|wc -l`
	LINE_COUNT=`find $1 -name "*.$2"|xargs cat|wc -l`

	if [ $FILE_COUNT -gt 0 ];then
		echo "$2 file count: $FILE_COUNT file"
		echo "$2 file line count:$LINE_COUNT line"

		SUM_FILE=`expr $SUM_FILE + $FILE_COUNT`
		SUM_LINE=`expr $SUM_LINE + $LINE_COUNT`
	fi

}

function main() {
	for extend in ${EXTEND_ARRAY[*]};do
		statistic $1 $extend
	done

	echo "sum file:$SUM_FILE"
	echo "sum line:$SUM_LINE"
}

main $1

