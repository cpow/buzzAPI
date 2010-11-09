#!/bin/sh

#Source the commands file
. ~/.bash_profile
. ~/Documents/uTest/buzzAPI/oacurlTest/common.sh

echo \
  '<entry xmlns:activity="http://activitystrea.ms/spec/1.0/"
          xmlns:poco="http://portablecontacts.net/ns/1.0"
          xmlns:buzz="http://schemas.google.com/buzz/2010">
    <activity:object-type>http://activitystrea.ms/schema/1.0/comment</activity:object-type>
    <content>My comment</content>
  </entry>' \
  | oacurl -X POST "https://www.googleapis.com/buzz/v1/activities/buzzapiplayground/@self/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144/@comments?prettyprint=true"

didThisFail
passATOM 
echo "creating an ATOM comment,Too Long of a string,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

sleep 3

oacurl -X DELETE "https://www.googleapis.com/buzz/v1/activities/117168590257167937559/@self/tag%3Agoogle.com%2C2010%3Abuzz%3Az12ltdq4bky1tzw5004cftt4msq3y3kj144/@comments/tag%3Agoogle.com%2C2010%3Abuzz-comment%3Az12ltdq4bky1tzw5004cftt4msq3y3kj144%3A1273777322692000" > `dirname $0`/file.txt >> something.txt

didThisFail
passATOM 
echo "deleting an ATOM comment,Too Long of a string,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

sleep 3

echo \
  '<entry xmlns:activity="http://activitystrea.ms/spec/1.0/"
          xmlns:poco="http://portablecontacts.net/ns/1.0"
          xmlns:buzz="http://schemas.google.com/buzz/2010">
    <activity:object-type>http://activitystrea.ms/schema/1.0/comment</activity:object-type>
    <content>My new comment</content>
  </entry>' \
  | oacurl -X PUT "https://www.googleapis.com/buzz/v1/activities/buzzapiplayground/@self/tag:google.com,2010:buzz:z12pvbwzirbcdf0cf22yid4q5kzkw3sd1/@comments/tag:google.com,2010:buzz-comment:z12ltdq4bky1tzw5004cftt4msq3y3kj144:1273777369071000?prettyprint=true"

didThisFail
passATOM 
echo "Updating an ATOM comment,Too Long of a string,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv


echo \
  '{
    "data": {
      "content": "My comment via json"
    }
   }' \
  | oacurl -t JSON -X POST "https://www.googleapis.com/buzz/v1/activities/buzzapiplayground/@self/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144/@comments?prettyprint=true&alt=json"

didThisFail
passJSON 
echo "creating an JSON comment,Too Long of a string,$PASSFAIL,$PASSFAILJSON" >> CSVResults.csv


echo \
  '{
    "data": {
      "content": "My new comment via json"
    }
   }' \
  | oacurl -t JSON -X PUT "https://www.googleapis.com/buzz/v1/activities/buzzapiplayground/@self/tag:google.com,2010:buzz:z12ltdq4bky1tzw5004cftt4msq3y3kj144/@comments/tag:google.com,2010:buzz-comment:z12ltdq4bky1tzw5004cftt4msq3y3kj144:1273777369071000?prettyprint=true&alt=json"

didThisFail
passJSON 
echo "updated a JSON comment,Too Long of a string,$PASSFAIL,$PASSFAILJSON" >> CSVResults.csv
