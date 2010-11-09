#!/bin/sh

#Source the commands file
. ~/.bash_profile
. ~/Documents/uTest/buzzAPI/oacurlTest/common.sh

echo ""
echo "get count of Link Shares ATOM"
echo ""

oacurl "https://www.googleapis.com/buzz/v1/activities/count?url=http://www.google.com&prettyprint=true&alt=atom" >> `dirname $0`/file.txt 
didThisFail
passATOM
echo "get count of link shares ATOM,https://www.googleapis.com/buzz/v1/activities/count?url=http://www.google.com&prettyprint=true&alt=atom,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

echo ""
echo "get count of Link Shares JSON"
echo ""

oacurl "https://www.googleapis.com/buzz/v1/activities/count?url=http://www.google.com&prettyprint=true&alt=json" >> `dirname $0`/file.txt 
didThisFail
passJSON
echo "get count of link shares JSON,https://www.googleapis.com/buzz/v1/activities/count?url=http://www.google.com&prettyprint=true&alt=atom,$PASSFAIL,$PASSFAILJSON" >> CSVResults.csv


echo ""
echo "Like a post on `date`"
echo ""
echo '' | oacurl -X PUT "https://www.googleapis.com/buzz/v1/activities/@me/@liked/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144?prettyprint=true" >> `dirname $0`/file.txt 
didThisFail
passATOM 
echo "Like a post ATOM,https://www.googleapis.com/buzz/v1/activities/@me/@liked/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144?prettyprint=true,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

sleep 3
echo ""
echo "Unlike a post on `date`"
echo ""
oacurl -X DELETE "https://www.googleapis.com/buzz/v1/activities/@me/@liked/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144?prettyprint=true" >> `dirname $0`/file.txt 
didThisFail
passATOM
echo "Unlike a post ATOM,https://www.googleapis.com/buzz/v1/activities/@me/@liked/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144?prettyprint=true,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

sleep 3
echo ""
echo "mute a post on `date`"
echo ""
echo '' | oacurl -X PUT "https://www.googleapis.com/buzz/v1/activities/@me/@muted/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144?prettyprint=true" >> `dirname $0`/file.txt 
didThisFail
passATOM
echo "mute a post ATOM,https://www.googleapis.com/buzz/v1/activities/@me/@muted/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144?prettyprint=true,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv
 
sleep 3
echo ""
echo "unmute a post on `date`"
echo ""
oacurl -X DELETE "https://www.googleapis.com/buzz/v1/activities/@me/@muted/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144?prettyprint=true" >> `dirname $0`/file.txt 
didThisFail
passATOM 

echo "unmute a post ATOM,https://www.googleapis.com/buzz/v1/activities/@me/@muted/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144?prettyprint=true,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

sleep 5
echo ""
echo "Update a post on `date`"
echo ""
echo \
  '<entry xmlns:activity="http://activitystrea.ms/spec/1.0/"
          xmlns:poco="http://portablecontacts.net/ns/1.0"
          xmlns:georss="http://www.georss.org/georss"
          xmlns:buzz="http://schemas.google.com/buzz/2010">
    <activity:object>
      <activity:object-type>http://activitystrea.ms/schema/1.0/note</activity:object-type>
      <content>Go Redsox!</content>
    </activity:object>
    <georss:point>42.370498 -71.083603</georss:point>
  </entry>' \
  | oacurl -X PUT "https://www.googleapis.com/buzz/v1/activities/@me/@self/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144?prettyprint=true" >> `dirname $0`/file.txt 
didThisFail
passATOM 

echo "update a post ATOM,https://www.googleapis.com/buzz/v1/activities/@me/@self/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144?prettyprint=true,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

echo ""
echo "Going to like a post via JSON"
echo ""
echo '' | oacurl -X PUT "https://www.googleapis.com/buzz/v1/activities/@me/@liked/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144?prettyprint=true&alt=json" >> `dirname $0`/file.txt 
didThisFail
passJSON 

echo "like a post JSON ATOM,https://www.googleapis.com/buzz/v1/activities/@me/@liked/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144?prettyprint=true&alt=json,$PASSFAIL,$PASSFAILJSON" >> CSVResults.csv

echo ""
echo "Unlike a post via JSON"
echo ""
oacurl -X DELETE "https://www.googleapis.com/buzz/v1/activities/@me/@liked/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144?prettyprint=true&alt=json" >> `dirname $0`/file.txt 
didThisFail
passJSON 

echo "unlike a post JSON ATOM,https://www.googleapis.com/buzz/v1/activities/@me/@liked/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144?prettyprint=true&alt=json,$PASSFAIL,$PASSFAILJSON" >> CSVResults.csv

echo ""
echo "mute a post via JSON"
echo ""
echo '' | oacurl -X PUT "https://www.googleapis.com/buzz/v1/activities/@me/@muted/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144?prettyprint=true&alt=json" >> `dirname $0`/file.txt 
didThisFail
passJSON 

echo "unlike a post JSON ATOM,https://www.googleapis.com/buzz/v1/activities/@me/@muted/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144?prettyprint=true&alt=json,$PASSFAIL,$PASSFAILJSON" >> CSVResults.csv

echo ""
echo "unmute a post via json"
echo ""
oacurl -X DELETE "https://www.googleapis.com/buzz/v1/activities/@me/@muted/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144?prettyprint=true&alt=json" >> `dirname $0`/file.txt 
didThisFail
passJSON 

echo "unlike a post JSON ATOM,https://www.googleapis.com/buzz/v1/activities/@me/@muted/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144?prettyprint=true&alt=json,$PASSFAIL,$PASSFAILJSON" >> CSVResults.csv
