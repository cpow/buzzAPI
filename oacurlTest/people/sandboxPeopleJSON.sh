#!/bin/sh

#Source the commands file
. ~/.bash_profile
. ~/Documents/uTest/buzzAPI/oacurlTest/common.sh


cat `dirname $0`/sandboxStringsJSON.txt | while read people; do

	
	oacurl -k "$people"  > `dirname $0`/file.txt
	
	sleep 2
	
	didThisFail
	
	
	sleep 2
	
	passJSON
	
	echo "People Strings JSON,$people,$PASSFAIL,$PASSFAILJSON" >> CSVResults.csv
	
done

echo ""
echo "Going to follow Sami Shalabi JSON"
echo '' | oacurl -X PUT "https://www.googleapis.com/buzz/v1partners/people/@me/@groups/@following/sami.shalabi?prettyprint=true&alt=json" > `dirname $0`/file.txt
didThisFail
passJSON
echo "Following Sami Shalabi,https://www.googleapis.com/buzz/v1partners/people/@me/@groups/@following/sami.shalabi?prettyprint=true&alt=json,$PASSFAIL,$PASSFAILJSON" >> CSVResults.csv

echo ""
echo "Going to unfollow Sami Shalabi JSON"
oacurl -X DELETE "https://www.googleapis.com/buzz/v1partners/people/@me/@groups/@following/sami.shalabi?prettyprint=true&alt=json" > `dirname $0`/file.txt
didthisFail
passJSON
echo "unfollow sami shalabi json, https://www.googleapis.com/buzz/v1partners/people/@me/@groups/@following/sami.shalabi?prettyprint=true,$PASSFAIL,$PASSFAILJSON" >> CSVResults.csv

echo ""
echo "Blocking poor sami json"
echo '' | oacurl -X PUT "https://www.googleapis.com/buzz/v1partners/people/@me/@groups/@blocked/sami.shalabi?prettyprint=true&alt=json" > `dirname $0`/file.txt
didThisFail
passJSON
echo "blocked sami shalabi json,https://www.googleapis.com/buzz/v1partners/people/@me/@groups/@blocked/sami.shalabi?prettyprint=true&alt=json,$PASSFAIL,$PASSFIALJSON" >> CSVResults.csv

echo ""
echo "unblocking poor sami json"
oacurl -X DELETE "https://www.googleapis.com/buzz/v1partners/people/@me/@groups/@blocked/sami.shalabi?prettyprint=true&alt=json" > `dirname $0`/file.txt
echo "unblocked poor sami json,https://www.googleapis.com/buzz/v1partners/people/@me/@groups/@blocked/sami.shalabi?prettyprint=true,$PASSFAIL,$PASSFAILJSON" >> CSVResults.csv
