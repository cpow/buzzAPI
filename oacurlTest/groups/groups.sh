#!/bin/sh

#Source the commands file
. ~/.bash_profile
. ~/Documents/uTest/buzzAPI/oacurlTest/common.sh

echo "gets my groups ATOM"
oacurl "https://www.googleapis.com/buzz/v1/people/@me/@groups?prettyprint=true" > `dirname $0`/file.txt
didThisFail
passATOM
echo "gets my groups ATOM,https://www.googleapis.com/buzz/v1/people/@me/@groups?prettyprint=true,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

echo "gets my groups JSON"
oacurl "https://www.googleapis.com/buzz/v1/people/@me/@groups?prettyprint=true&alt=json" > `dirname $0`/file.txt
didThisFail
passJSON
echo "gets my groups ATOM,https://www.googleapis.com/buzz/v1/people/@me/@groups?prettyprint=true&alt=json,$PASSFAIL,$PASSFAILJSON" >> CSVResults.csv

echo "Creating a group ATOM..."
echo \
  '<entry>
    <title>My group</title>
   </entry>' \
  | oacurl -X POST "https://www.googleapis.com/buzz/v1/people/@me/@groups?prettyprint=true" > `dirname $0`/file.txt
didThisFail
passATOM
echo"Creaing a group ATOM,too long,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

echo "Creating a group JSON..."
echo \
  '{
    "data": {
      "title": "My group via json"
    }
   }' \
  | oacurl -t JSON -X POST "https://www.googleapis.com/buzz/v1/people/@me/@groups?prettyprint=true&alt=json" > `dirname $0`/file.txt
didThisFail
passJSON
echo"Creaing a group JSON,too long,$PASSFAIL,$PASSFAILJSON" >> CSVResults.csv

echo "Add a person to a group ATOM"
echo '' | oacurl -X PUT "https://www.googleapis.com/buzz/v1/people/@me/@groups/tag:google.com,2010:buzz-group:@me:14/sami.shalabi?prettyprint=true" > `dirname $0`/file.txt
didThisFail
passATOM
echo"Add a person to a group,too long,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

echo "Add a person to a group JSON"
echo '' | oacurl -X PUT "https://www.googleapis.com/buzz/v1/people/@me/@groups/tag:google.com,2010:buzz-group:@me:14/sami.shalabi?prettyprint=true&alt=json" > `dirname $0`/file.txt
didThisFail
passJSON
echo"Add a person to a group JSON,too long,$PASSFAIL,$PASSFAILJSON" >> CSVResults.csv

echo "Remove person from a group ATOM"
oacurl -X DELETE "https://www.googleapis.com/buzz/v1/people/@me/@groups/tag:google.com,2010:buzz-group:@me:14/sami.shalabi?prettyprint=true" > `dirname $0`/file.txt
didThisFail
passATOM
echo "remove person from a group,https://www.googleapis.com/buzz/v1/people/@me/@groups/tag:google.com,2010:buzz-group:@me:14/sami.shalabi?prettyprint=true,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

echo "Remove person from a group JSON"
oacurl -X DELETE "https://www.googleapis.com/buzz/v1/people/@me/@groups/tag:google.com,2010:buzz-group:@me:14/sami.shalabi?prettyprint=true&alt=json" > `dirname $0`/file.txt
didThisFail
passJSON
echo "remove person from a group,https://www.googleapis.com/buzz/v1/people/@me/@groups/tag:google.com,2010:buzz-group:@me:14/sami.shalabi?prettyprint=true&alt=json,$PASSFAIL,$PASSFAILJSON" >> CSVResults.csv

echo "rename a group ATOM"
echo \
  '<entry>
    <title>New group name 2</title>
   </entry>' \
  | oacurl -X PUT "https://www.googleapis.com/buzz/v1/people/@me/@groups/tag:google.com,2010:buzz-group:@me:6022319895433122000/@self?prettyprint=true" > `dirname $0`/file.txt
didThisFail
passATOM
echo "rename a group ATOM,too long,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

echo "rename a group JSON"
echo \
  '{
    "data": {
      "title": "New group 2 via json"
    }
   }' \
  | oacurl -t JSON -X PUT "https://www.googleapis.com/buzz/v1/people/@me/@groups/tag:google.com,2010:buzz-group:@me:6022319895433122000/@self?prettyprint=true&alt=json" > `dirname $0`/file.txt
didThisFail
passJSON
echo "rename a group JSON,too long,$PASSFAIL,$PASSFAILJSON" >> CSVResults.csv

echo "get a group ATOM"
oacurl "https://www.googleapis.com/buzz/v1/people/@me/@groups/tag:google.com,2010:buzz-group:@me:6022319895433122000/@self?prettyprint=true" > `dirname $0`/file.txt
didThisFail
passATOM
echo "get a group ATOM,too long,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

echo "get a group JSON"
oacurl "https://www.googleapis.com/buzz/v1/people/@me/@groups/tag:google.com,2010:buzz-group:@me:6022319895433122000/@self?prettyprint=true&alt=json" > `dirname $0`/file.txt
didThisFail
passJSON
echo "get a group JSON,too long,$PASSFAIL,$PASSFAILJSON" >> CSVResults.csv

echo "Group members ATOM"
oacurl "https://www.googleapis.com/buzz/v1/people/@me/@groups/tag:google.com,2010:buzz-group:45621564:63122000?prettyprint=true" > `dirname $0`/file.txt
didThisFail
passATOM
echo "group members ATOM,https://www.googleapis.com/buzz/v1/people/@me/@groups/tag:google.com,2010:buzz-group:45621564:63122000?prettyprint=true,$PASSFAIL,$PASSFAILATOM"

echo "Group members JSON"
oacurl "https://www.googleapis.com/buzz/v1/people/@me/@groups/tag:google.com,2010:buzz-group:45621564:63122000?prettyprint=true&alt=json" > `dirname $0`/file.txt
didThisFail
passJSON
echo "group members JSON,https://www.googleapis.com/buzz/v1/people/@me/@groups/tag:google.com,2010:buzz-group:45621564:63122000?prettyprint=true&alt=json,$PASSFAIL,$PASSFAILJSON"


####### THIS IS FOR NEGATIVE GROUP MAKING TESTING ##########

echo "Creating a group ATOM..."
echo \
  '<entry>
    <title>My group</title>
   </entry>' \
  | oacurl -X POST "https://www.googleapis.com/buzz/v1/people/@me/@groups?prettyprint=true" > `dirname $0`/file.txt
didThisFail
passATOM
echo "Negative: Create a group that already exists ATOM,too long,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

echo "Creating a group JSON..."
echo \
  '{
    "data": {
      "title": "My group via json"
    }
   }' \
  | oacurl -t JSON -X POST "https://www.googleapis.com/buzz/v1/people/@me/@groups?prettyprint=true&alt=json" > `dirname $0`/file.txt
didThisFail
passJSON
echo "Negative: Create a group that already exists JSON,too long,$PASSFAIL,$PASSFAILJSON" >> CSVResults.csv