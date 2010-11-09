#!/bin/sh

#This will run all the test scripts associated with oaCurl buzz API testing.
###
###

DIR=~/Documents/uTest/buzzAPI

. $DIR/oacurl-1.0.0.jar

echo "******************************************"
echo "Running the People tests for ATOM"
echo "******************************************"
./oacurlTest/people/peopleATOM.sh 

echo "******************************************"
echo "Running the People tests for JSON"
echo "******************************************"
./oacurlTest/people/peopleJSON.sh 

echo "******************************************"
echo "Running the Posts tests"
echo "******************************************"
./oacurlTest/posts/posts.sh 

echo "******************************************"
echo "Running the mediaPost tests"
echo "******************************************"
./oacurlTest/posts/mediaPosts.sh 

echo "******************************************"
echo "Running the postActions tests"
echo "******************************************"
./oacurlTest/posts/postActions.sh 

echo "******************************************"
echo "Running the comments tests"
echo "******************************************"
./oacurlTest/posts/comments.sh 

echo "******************************************"
echo "Running the streams tests"
echo "******************************************"
./oacurlTest/streams/streams.sh 