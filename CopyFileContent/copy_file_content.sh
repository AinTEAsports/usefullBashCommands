#!/usr/bin/bash

function help {
	echo "
${0}: help message
Usage: ${0} <filename>"
}



if [[ -z $1 ]]; then
	echo "[!] No filename given"
	help
	exit 1
elif [[ ! -e $1 ]]; then
	echo "[!] File not found or does not exists"
	help
	exit 2
fi


filename=$1
file_content=$(cat ${filename})

python3 -c "import pyperclip; pyperclip.copy('${file_content}')"

