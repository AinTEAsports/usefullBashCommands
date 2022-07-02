#!/bin/bash


ascii_art="\n
           __                  __    \n
  ___ ___ / /___ _____    ___ / /    \n
 (_-</ -_) __/ // / _ \_ (_-</ _ \\  \n
/___/\__/\__/\\_,_/ .__(_)___/_//_/  \n
                /_/                  \n
"

echo -e $ascii_art


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

