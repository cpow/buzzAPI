#!/bin/sh

#Source the commands file
. ~/.bash_profile
. ~/Documents/uTest/buzzAPI/oacurlTest/common.sh

echo ""
echo "Creating a post with picone as the image attachment on `date`"
echo ""
echo   '<entry xmlns:activity="http://activitystrea.ms/spec/1.0/"
          xmlns:poco="http://portablecontacts.net/ns/1.0"
          xmlns:georss="http://www.georss.org/georss"
          xmlns:buzz="http://schemas.google.com/buzz/2010">
    <activity:object>
      <activity:object-type>http://activitystrea.ms/schema/1.0/note</activity:object-type>
      <content>Bzz Buz with attachement!</content>
    </activity:object>
  </entry>' > /tmp/post.xml && oacurl -R ~/Documents/uTest/buzzAPI/oacurlTest/posts/picone.png -R "/tmp/post.xml;application/atom+xml" "https://www.googleapis.com/buzz/v1/activities/@me/@self?prettyprint=true" | tee `dirname $0`/file.txt >> something.txt

didThisFail
passATOM

echo "Creating a post with picone as the image attachment,String is too long,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

sleep 5
echo ""
echo "Creating a post with multiple image attachments... on `date`"
echo ""
echo \
  '<entry xmlns="http://www.w3.org/2005/Atom"
          xmlns:activity="http://activitystrea.ms/spec/1.0/"
          xmlns:buzz="http://schemas.google.com/buzz/2010">
    <content>Post several attacheds photos!</content>
    <activity:object>
      <buzz:attachment>
        <activity:object-type>http://activitystrea.ms/schema/1.0/photo-album</activity:object-type>
        <title>My uploaded photos</title>
        <link href="http://picasaweb.google.com/112995641975375522142/2010081505?authkey=Gv1sRgCMSSgNDIiJGC5QE" rel="alternate" type="text/html"/>
      </buzz:attachment>
    </activity:object>
  </entry>' \
  | oacurl -X POST "https://www.googleapis.com/buzz/v1/activities/@me/@self?prettyprint=true&preview=true" \
  | oacurl -X POST "https://www.googleapis.com/buzz/v1/activities/@me/@self?prettyprint=true" > `dirname $0`/file.txt >> something.txt

didThisFail
passATOM 
echo "Creating a post with multiple image attachments,String too long,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

echo ""
echo "Creating a post with picone as the image attachment via JSON on `date`"
echo ""
echo \
  '{
    "data": {
      "object": {
        "type": "note",
        "content": "Bzz Buz with attachement via JSON!"
      }
    }
   }' > /tmp/post.json && \
   oacurl -R ~/Documents/uTest/buzzAPI/oacurlTest/posts/picone.png -R "/tmp/post.json;application/json" "https://www.googleapis.com/buzz/v1/activities/@me/@self?prettyprint=true&alt=json" > `dirname $0`/file.txt >> something.txt
didThisFail 
passJSON 

echo ""
echo "Creating a Post with multiple image attachments via JSON on `date`"
echo ""
echo \
  '{
    "data": {
      "object": {
        "type": "note",
        "content": "Post with several attached photos via JSON",
        "attachments": [
          {
          "type": "photo-album",
          "title": "My uploaded photos",
          "links": {
           "alternate": [{
              "href": "http://picasaweb.google.com/112995641975375522142/2010081505?authkey=Gv1sRgCMSSgNDIiJGC5QE",
              "type": "text/html"
             }]
           }
          }
        ]
      }
    }
   }' \
  | oacurl -t JSON -X POST "https://www.googleapis.com/buzz/v1/activities/@me/@self?prettyprint=true&preview=true&alt=json" \
  | oacurl -t JSON -X POST "https://www.googleapis.com/buzz/v1/activities/@me/@self?prettyprint=true&alt=json" > `dirname $0`/| tee `dirname $0`/file.txt >> something.txt
didThisFail 
passJSON
echo "Creating a Post with multiple image attachments via JSON,String too long,$PASSFAIL,$PASSFAILJSON" >> CSVResults.csv
