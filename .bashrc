# Load all files in .bashrc.d

for file in ~/.bashrc.d/*;
do
	source $file
done

