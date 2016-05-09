#!/bin/bash

# fastdl location
fastdl="/var/www/fastdl"

# get
theaters=$(find insurgency/scripts/theaters/ -iname '*.theater' -print)

# cp, rm, and bzip2 new files
for i in $theaters
do
	# announce
	root=$(dirname $i | cut -d'/' -f2-)
	name=$(basename $i)
	# new_name=$(echo `basename $i | cut -d'.' -f-1`_`date +"%Y%m%d"`.theater)
	target="$fastdl/$root/$name"

	# copy, remove old & bzip2
	cp $i $target
	rm $target.bz2
	bzip2 $target

	# done
	echo \* Wrote $target.bz2 \($name\)
done
