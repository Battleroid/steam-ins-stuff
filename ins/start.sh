#!/bin/bash
theater="+mp_theater_override"

if [ -z "$1" ]
then
	theater="$theater default"
	echo \[START\] No theater specified, ignoring...
else
	theater="$theater $1"
	echo \[START\] Using $1 as theater...
fi

echo \[START\] Removing old tmp files...
rm theaters/*.ztmp

echo \[START\] Preparing FastDL...
./fastdl.sh

echo \[START\] Starting...
./srcds_run -game insurgency -console +sv_lan 0 -port 27015 +map "ministry outpost" $theater +sv_workshop_enabled 1 -authkey authkeyhere
