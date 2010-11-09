#!/bin/sh

#Source the commands file
. ~/.bash_profile
. ~/Documents/uTest/buzzAPI/oacurlTest/common.sh

echo ""
echo "Creating a public post...on `date`"
echo ""
sleep 2
echo '<entry xmlns:activity="http://activitystrea.ms/spec/1.0/"
          xmlns:poco="http://portablecontacts.net/ns/1.0"
          xmlns:georss="http://www.georss.org/georss"
          xmlns:buzz="http://schemas.google.com/buzz/2010">
    <activity:object>
      <activity:object-type>http://activitystrea.ms/schema/1.0/note</activity:object-type>
      <content>Bzz! Bzz!</content>
    </activity:object>
  </entry>' | oacurl -X POST "https://www.googleapis.com/buzz/v1/activities/@me/@self?prettyprint=true" | tee `dirname $0`/file.txt >> something.txt

didThisFail
passATOM 

echo "Created a public post,long string,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv


sleep 5

echo ""
echo "Creating a post with a photo...on `date`"
echo ""


echo \
  '<entry xmlns:activity="http://activitystrea.ms/spec/1.0/"
          xmlns:poco="http://portablecontacts.net/ns/1.0"
          xmlns:georss="http://www.georss.org/georss"
          xmlns:buzz="http://schemas.google.com/buzz/2010">
    <activity:object>
      <activity:object-type>http://activitystrea.ms/schema/1.0/note</activity:object-type>
      <content>Post with an image!</content>
      <buzz:attachment>
        <activity:object-type>http://activitystrea.ms/schema/1.0/photo</activity:object-type>
        <link href="http://www.google.com/intl/en_ALL/images/srpr/logo1w.png" rel="enclosure" type="image/png"/>
      </buzz:attachment>
    </activity:object>
  </entry>' \
  | oacurl -X POST "https://www.googleapis.com/buzz/v1/activities/@me/@self?prettyprint=true&preview=true" \
  | oacurl -X POST "https://www.googleapis.com/buzz/v1/activities/@me/@self?prettyprint=true" | tee `dirname $0`/file.txt >> something.txt 

didThisFail
passATOM 

echo "Created a post with photo,long string,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv


sleep 5

echo ""
echo "Creating a post with an article...on `date`"
echo ""



echo \
  '<entry xmlns:activity="http://activitystrea.ms/spec/1.0/"
          xmlns:poco="http://portablecontacts.net/ns/1.0"
          xmlns:georss="http://www.georss.org/georss"
          xmlns:buzz="http://schemas.google.com/buzz/2010">
    <activity:object>
      <activity:object-type>http://activitystrea.ms/schema/1.0/note</activity:object-type>
      <content>Post with a link!</content>
      <buzz:attachment>
        <activity:object-type>http://activitystrea.ms/schema/1.0/article</activity:object-type>
        <title>Google Buzz buttons</title>
        <link href="http://gmailblog.blogspot.com/2010/04/google-buzz-buttons.html" rel="alternate" type="text/html"/>
      </buzz:attachment>
    </activity:object>
  </entry>' \
  | oacurl -X POST "https://www.googleapis.com/buzz/v1/activities/@me/@self?prettyprint=true&preview=true" \
  | oacurl -X POST "https://www.googleapis.com/buzz/v1/activities/@me/@self?prettyprint=true" | tee `dirname $0`/file.txt 

didThisFail
passATOM

echo "Created a post with an article,long string,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv
 
sleep 5

echo ""
echo "Creating a post with a video...on `date`"
echo ""


echo \
  '<entry xmlns:activity="http://activitystrea.ms/spec/1.0/"
          xmlns:poco="http://portablecontacts.net/ns/1.0"
          xmlns:georss="http://www.georss.org/georss"
          xmlns:buzz="http://schemas.google.com/buzz/2010">
    <activity:object>
      <activity:object-type>http://activitystrea.ms/schema/1.0/note</activity:object-type>
      <content>Post with a video!</content>
      <buzz:attachment>
        <activity:object-type>http://activitystrea.ms/schema/1.0/video</activity:object-type>
        <link href="http://www.youtube.com/watch?v=nnsSUqgkDwU" rel="alternate" type="text/html"/>
      </buzz:attachment>
    </activity:object>
  </entry>' \
  | oacurl -X POST "https://www.googleapis.com/buzz/v1/activities/@me/@self?prettyprint=true&preview=true" \
  | oacurl -X POST "https://www.googleapis.com/buzz/v1/activities/@me/@self?prettyprint=true" | tee `dirname $0`/file.txt >> something.txt 

didThisFail
passATOM 
echo "Created a post with a video,long string,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

sleep 5

echo ""
echo "Creating a post with a photo album...on `date`"
echo ""

echo \
  '<entry xmlns:activity="http://activitystrea.ms/spec/1.0/"
          xmlns:poco="http://portablecontacts.net/ns/1.0"
          xmlns:georss="http://www.georss.org/georss"
          xmlns:buzz="http://schemas.google.com/buzz/2010">
    <activity:object>
      <activity:object-type>http://activitystrea.ms/schema/1.0/note</activity:object-type>
      <content>Post with photo album!</content>
      <buzz:attachment>
        <activity:object-type>http://activitystrea.ms/schema/1.0/photo-album</activity:object-type>
        <title>Vegas Weekend</title>
        <link href="http://picasaweb.google.com/picasateam/VegasWeekend" rel="alternate" type="text/html"/>
      </buzz:attachment>
    </activity:object>
  </entry>' \
  | oacurl -X POST "https://www.googleapis.com/buzz/v1/activities/@me/@self?prettyprint=true&preview=true" \
  | oacurl -X POST "https://www.googleapis.com/buzz/v1/activities/@me/@self?prettyprint=true" | tee `dirname $0`/file.txt >> something.txt 

didThisFail
passATOM

echo "Created a post with photo album,long string,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv
 
sleep 5

echo ""
echo "Creating a post with a photo album and location on `date`"
echo ""

echo \
  '<entry xmlns:activity="http://activitystrea.ms/spec/1.0/"
          xmlns:poco="http://portablecontacts.net/ns/1.0"
          xmlns:georss="http://www.georss.org/georss"
          xmlns:buzz="http://schemas.google.com/buzz/2010">
    <activity:object>
      <activity:object-type>http://activitystrea.ms/schema/1.0/note</activity:object-type>
      <content>Post with photo album with location!</content>
      <buzz:attachment>
        <activity:object-type>http://activitystrea.ms/schema/1.0/photo-album</activity:object-type>
        <title>Vegas Weekend</title>
        <link href="http://picasaweb.google.com/picasateam/VegasWeekend" rel="alternate" type="text/html"/>
      </buzz:attachment>
    </activity:object>
    <georss:point>36.116921 -115.172296</georss:point>
  </entry>' \
  | oacurl -X POST "https://www.googleapis.com/buzz/v1/activities/@me/@self?prettyprint=true&preview=true" \
  | oacurl -X POST "https://www.googleapis.com/buzz/v1/activities/@me/@self?prettyprint=true" | tee `dirname $0`/file.txt >> something.txt 

didThisFail
passATOM 
echo "Created a post with photo album and location,long string,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv


sleep 5
echo ""
echo "Creating a private post ...on `date`"
echo ""
echo \
  '<entry xmlns:activity="http://activitystrea.ms/spec/1.0/"
          xmlns:poco="http://portablecontacts.net/ns/1.0"
          xmlns:georss="http://www.georss.org/georss"
          xmlns:buzz="http://schemas.google.com/buzz/2010">
    <activity:object>
      <activity:object-type>http://activitystrea.ms/schema/1.0/note</activity:object-type>
      <content>Private post!</content>
    </activity:object>
    <buzz:visibility>
      <buzz:aclentry type="group">
        <poco:id>tag:google.com,2010:buzz-group:@me:13</poco:id>
      </buzz:aclentry>
    </buzz:visibility>
  </entry>' \
  | oacurl -X POST "https://www.googleapis.com/buzz/v1/activities/@me/@self?prettyprint=true" | tee `dirname $0`/file.txt >> something.txt 

didThisFail
passATOM 

echo "Created a private post,long string,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv


sleep 5
echo ""
echo "Creating a post with a location on `date`"
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
  | oacurl -X POST "https://www.googleapis.com/buzz/v1/activities/@me/@self?prettyprint=true" | tee `dirname $0`/file.txt >> something.txt

didThisFail
passATOM 
echo "Created a post snapped to place,long string,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv

sleep 5
echo ""
echo "creating a post snapped to place on `date`"
echo ""

curl -X GET "http://maps.google.com/maps/api/place/search/xml?location=42.3628827,-71.0878654&radius=100&sensor=false"
# Extract a reference from above and add to <buzz:placeId>
echo \
  '<entry xmlns:activity="http://activitystrea.ms/spec/1.0/"
          xmlns:poco="http://portablecontacts.net/ns/1.0"
          xmlns:georss="http://www.georss.org/georss"
          xmlns:buzz="http://schemas.google.com/buzz/2010">
    <activity:object>
      <activity:object-type>http://activitystrea.ms/schema/1.0/note</activity:object-type>
      <content>I am at Google Boston!</content>
    </activity:object>
    <buzz:placeId>CkQ6AAAA11-ykKK8mNCmfSTu9mOJzycQEMmYhAHcmOBt_G0IfZaA-0bPCDUTZaLKnskzqipJi3ljzUqlJ3SUvqL2GpyThRIQOPA13i2LQ3ttW4skW22YyxoUzIpT90QeEa9nswO7XqpywYuyErQ</buzz:placeId>
  </entry>' \
  | oacurl -X POST "https://www.googleapis.com/buzz/v1/activities/@me/@self?prettyprint=true" | tee `dirname $0`/file.txt >> something.txt 


didThisFail
passATOM 
echo "Created a post with a location,long string,$PASSFAIL,$PASSFAILATOM" >> CSVResults.csv
