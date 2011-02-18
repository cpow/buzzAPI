#!/bin/sh

#Source the commands file
. ~/.bash_profile
. ~/Documents/uTest/buzzAPI/oacurlTest/common.sh


cat `dirname $0`/sandboxactivityATOM.txt | while read atomActivity; do

	oacurl "$atomActivity" > `dirname $0`/file.txt
	
	sleep 2
	
	passATOM
	
	cat `dirname $0`/file.txt | grep error > output.txt
	if [ $? -eq 0 ]; then
		echo "Activity String ATOM Sandbox,$atomActivity,Failed,$PASSFAILATOM" >> CSVResults.csv
	else
		echo "Activity String ATOM Sandbox,$atomActivity,Passed,$PASSFAILATOM" >> CSVResults.csv
	fi
	

done

cat `dirname $0`/sandboxactivityJSON.txt | while read jsonActivity; do

	oacurl "$jsonActivity" > `dirname $0`/file.txt
	
	sleep 2
	
	passATOM
	
	cat `dirname $0`/file.txt | grep error > output.txt
	if [ $? -eq 0 ]; then
		echo "Activity String JSON sandbox,$jsonActivity,Failed,$PASSFAILJSON" >> CSVResults.csv
	else
		echo "Activity String JSON sandbox,$jsonActivity,Passed,$PASSFAILJSON" >> CSVResults.csv
	fi
	

done