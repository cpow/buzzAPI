#!/bin/sh

#Source the commands file
. ~/.bash_profile
. ~/Documents/uTest/buzzAPI/oacurlTest/common.sh



cat `dirname $0`/stringsATOM.txt | while read people; do
	
	oacurl -k "$people" >> `dirname $0`/file.txt 2>&1 &
	
	sleep 2
	
	didThisFail
	
	sleep 2
	
	passATOM
	
	echo "People Strings ATOM,$people,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv
	
done

echo ""
echo "Going to follow Sami Shalabi ATOM"
echo '' | oacurl -X PUT "https://www.googleapis.com/buzz/v1/people/@me/@groups/@following/sami.shalabi?prettyprint=true" >> `dirname $0`/file.txt
didThisFail
passATOM
echo "Following Sami Shalabi ATOM,https://www.googleapis.com/buzz/v1/people/@me/@groups/@following/sami.shalabi?prettyprint=true,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

echo ""
echo "Going to unfollow Sami Shalabi ATOM"
oacurl -X DELETE "https://www.googleapis.com/buzz/v1/people/@me/@groups/@following/sami.shalabi?prettyprint=true" >> `dirname $0`/file.txt
didthisFail
passATOM
echo "unfollow sami shalabi atom, https://www.googleapis.com/buzz/v1/people/@me/@groups/@following/sami.shalabi?prettyprint=true,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

echo ""
echo "Blocking poor sami"
echo '' | oacurl -X PUT "https://www.googleapis.com/buzz/v1/people/@me/@groups/@blocked/sami.shalabi?prettyprint=true" >> `dirname $0`/file.txt
didThisFail
passATOM
echo "blocked sami shalabi atom,https://www.googleapis.com/buzz/v1/people/@me/@groups/@blocked/sami.shalabi?prettyprint=true,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

echo ""
echo "unblocking poor sami"
oacurl -X DELETE "https://www.googleapis.com/buzz/v1/people/@me/@groups/@blocked/sami.shalabi?prettyprint=true" >> `dirname $0`/file.txt
echo "unblocked poor sami atom,https://www.googleapis.com/buzz/v1/people/@me/@groups/@blocked/sami.shalabi?prettyprint=true,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv