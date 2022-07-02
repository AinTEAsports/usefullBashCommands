#!/bin/bash


ascii_art="SETUP.PY"
echo -e "${ascii_art}\n"


for filename in $(ls -1R); do
	if [[ $filename == ./* ]]; then
		continue
	fi

	# Getting full path of file
	filename=$(find $(pwd) -name $filename)

	if [[ $filename == ${0} ]]; then
		continue
	fi

	if [[ -f $filename && $(cat $filename) == "#!/"* ]]; then
		echo "[*] $(basename $filename)"
		chmod +x "${filename}"
	fi
done

