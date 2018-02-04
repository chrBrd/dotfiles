# Load all files in .bashrc.d

for file in ~/.bashrc.d/*;
do
	if [[ $file == *.bashrc ]]
	then	
		source $file
	fi
done

