#/bin/bash

# Here's the first line of code to write to do the first homework assignment.
#
# In /scratch2/scratchdirs/nugent/astro250/hwk1 we have a set of fits files as well as catalogs
# from these fits files. They are named the same save for the suffix (.fits or .cat). 
# Some of the .cat files are missing. Write a bash shell script which takes as input 
# the directory name and prints out the names of the .fits files which are missing their 
# corresponding .cat files. If the directory does not exist, the code should print
# out an error statement accordingly.
#

dir=$1
for file in "$dir"/*; do
  name=${file%.*}
  ext=${file##*.}
  if [[ $ext == fits ]] && ! [[ -f "$name".cat ]]; then
    echo $file
  fi
done

if ! [ -d $dir ]; then
  echo "This directory does not exist!"
  exit 0
fi

