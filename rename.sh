#!/bin/bash

function recurse_file(){
	if [ $# -eq 2 ];then
		for file in `ls $1`
		do
			if [ -d $1/$file ];then
				recurse_file $1/$file $2
			else
				if [ $1/$file = $0 ];then
					continue
				fi

				if [ $2 != ${file##*.} ];then		
					mv $1/$file $1/$file.$2
				fi
			fi
		done
	else
		echo "check you input paraments count"
	fi
}

function recover_file(){
	if [ $# -eq 2 ];then
		for file in `ls $1`
		do
			if [ -d $1/$file ];then
				recurse_file $1/$file $2
			else
				if [ $1/$file = $0 ];then
					continue
				fi

				if [ $2 = ${file##*.} ];then #${file##*.} extention name
					echo "$1/$file"
					mv $1/$file $1/${file%.*} #${file%.*} except extention name
				fi
			fi
		done
	else
		echo "check you input paraments count"
	fi

}

function rename_file(){
	if [ $# -le 2 ] && [ $# -ge 1 ];then
		for file in `ls $1`
		do
			if [ -d $1/$file ];then
				rename_file $1/$file $2
			else
				if [ $1/$file = $0 ];then
					continue
				fi

				echo "$1/$file"
				if [ $# -eq 2 ];then
					mv $1/$file $1/${file%%.*}.$2
				else
					mv $1/$file $1/${file%%.*}
				fi
			fi
		done
	else
		echo "check you input paraments count"
	fi
}

function menu(){
	echo "1.add extention name"
	echo "2.cancel extention name"
	echo "3.rename file"

}

function main(){
	menu
	read choice
#	echo "input path"
#	read path
#	echo "type"
#	read name
	path=$1
	name=$2
	if [ $choice = "1" ];then
		recurse_file $path $name
	elif [ $choice = "2" ];then
		recover_file $path $name
	elif [ $choice = "3" ];then
		rename_file $path $name
	fi	

}

main $1 $2
