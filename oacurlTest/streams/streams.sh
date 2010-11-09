#!/bin/sh

#Source the commands file
. ~/.bash_profile
. ~/Documents/uTest/buzzAPI/oacurlTest/common.sh


cat `dirname $0`/activityATOM.txt | while read atomActivity; do

	oacurl "$atomActivity" > `dirname $0`/file.txt
	
	sleep 2
	
	passATOM
	
	cat `dirname $0`/file.txt | grep error > output.txt
	if [ $? -eq 0 ]; then
		echo "Activity String ATOM,$atomActivity,Failed,$PASSFAILATOM" >> CSVResults.csv
	else
		echo "Activity String ATOM,$atomActivity,Passed,$PASSFAILATOM" >> CSVResults.csv
	fi
	

done

cat `dirname $0`/activityJSON.txt | while read jsonActivity; do

	oacurl "$jsonActivity" > `dirname $0`/file.txt
	
	sleep 2
	
	passATOM
	
	cat `dirname $0`/file.txt | grep error > output.txt
	if [ $? -eq 0 ]; then
		echo "Activity String JSON,$jsonActivity,Failed,$PASSFAILJSON" >> CSVResults.csv
	else
		echo "Activity String JSON,$jsonActivity,Passed,$PASSFAILJSON" >> CSVResults.csv
	fi
	

done

cat `dirname $0`/searchStrings.txt | while read search; do

	oacurl "$search" > `dirname $0`/file.txt
	
	sleep 2
	
	passATOM
	
	cat `dirname $0`/file.txt | grep error > output.txt
	if [ $? -eq 0 ]; then
		echo "Search String ATOM,$search,Failed,$PASSFAILATOM" >> CSVResults.csv
	else
		echo "Search String ATOM,$search,Passed,$PASSFAILATOM" >> CSVResults.csv
	fi
	

done

cat `dirname $0`/searchStringsJSON.txt | while read search; do

	oacurl "$search" > `dirname $0`/file.txt
	
	sleep 2
	
	passJSON
	
	cat `dirname $0`/file.txt | grep error > output.txt
	if [ $? -eq 0 ]; then
		echo "Search String JSON,$search,Failed,$PASSFAILJSON" >> CSVResults.csv
	else
		echo "Search String JSON,$search,Passed,$PASSFAILJSON" >> CSVResults.csv
	fi
	

done



sleep 5

cat `dirname $0`/myStreams.txt | while read myStream; do

	oacurl "$myStream" > `dirname $0`/file.txt
	
	sleep 2
	
	passATOM
	
	cat `dirname $0`/file.txt | grep error > output.txt
	if [ $? -eq 0 ]; then
		echo "My Stream ATOM,$myStream,Failed,$PASSFAILATOM" >> CSVResults.csv
	else
		echo "My Stream ATOM,$myStream,Passed,$PASSFAILATOM" >> CSVResults.csv
	fi
	

done

cat `dirname $0`/myStreamsJSON.txt | while read myStream; do

	oacurl "$myStream" > `dirname $0`/file.txt
	
	sleep 2
	
	passJSON
	
	cat `dirname $0`/file.txt | grep error > output.txt
	if [ $? -eq 0 ]; then
		echo "My Stream JSON,$myStream,Failed,$PASSFAILJSON" >> CSVResults.csv
	else
		echo "My Stream JSON,$myStream,Passed,$PASSFAILJSON" >> CSVResults.csv
	fi
	

done


sleep 5

cat `dirname $0`/loadedStreams.txt | while read loadedStream; do
	
	oacurl "$loadedStream" > `dirname $0`/file.txt
	
	sleep 2
	
	passATOM
	
	cat `dirname $0`/file.txt | grep error > output.txt
	if [ $? -eq 0 ]; then
		echo "Loaded Stream ATOM,$loadedStream,Failed,$PASSFAILATOM" >> CSVResults.csv
	else
		echo "Loaded Stream ATOM,$loadedStream,Passed,$PASSFAILATOM" >> CSVResults.csv
	fi
	

done

cat `dirname $0`/loadedStreamsJSON.txt | while read loadedStream; do
	
	oacurl "$loadedStream" > `dirname $0`/file.txt
	
	sleep 2
	
	passJSON
	
	cat `dirname $0`/file.txt | grep error > output.txt
	if [ $? -eq 0 ]; then
		echo "Loaded Stream JSON,$loadedStream,Failed,$PASSFAILJSON" >> CSVResults.csv
	else
		echo "Loaded Stream JSON,$loadedStream,Passed,$PASSFAILJSON" >> CSVResults.csv
	fi
	

done

sleep 5

cat `dirname $0`/userStreams.txt | while read userStream; do
	oacurl "$userStream" > `dirname $0`/file.txt
	
	sleep 2
	
	passATOM
	
	cat `dirname $0`/file.txt | grep error > output.txt
	if [ $? -eq 0 ]; then
		echo "User Stream ATOM,$userStream,Failed,$PASSFAILATOM" >> CSVResults.csv
	else
		echo "User Stream ATOM,$userStream,Passed,$PASSFAILATOM" >> CSVResults.csv
	fi
	
done

cat `dirname $0`/userStreamsJSON.txt | while read userStream; do
	oacurl "$userStream" > `dirname $0`/file.txt
	
	sleep 2
	
	passJSON
	
	cat `dirname $0`/file.txt | grep error > output.txt
	if [ $? -eq 0 ]; then
		echo "User Stream JSON,$userStream,Failed,$PASSFAILJSON" >> CSVResults.csv
	else
		echo "User Stream JSON,$userStream,Passed,$PASSFAILJSON" >> CSVResults.csv
	fi
	
done