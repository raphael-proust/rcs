#!/bin/sh

property="TouchpadOff"

if [ $(synclient -l |grep $property | awk '{print $3}') = "0" ]
then
	synclient $property=1
else
	if [ $(synclient -l |grep $property | awk '{print $3}') = "1" ]
	then
		synclient $property=0
	fi
fi
