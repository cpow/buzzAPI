#!/bin/sh

#function to find failure text within output of oacurl command
#This is a change to the code

didThisFail ()
{	
	cat `dirname $0`/file.txt | grep error 
	  if [ $? = 0 ]; then
   		PASSFAIL="Failed" 
	  else
		cat `dirname $0`/file.txt | grep exception 
			if [ $? = 0 ]; then
		  		PASSFAIL="Failed" 
			else
	  			PASSFAIL="Passed" 
			fi
	  fi
}

passJSON () 
{
	cat `dirname $0`/file.txt | grep { > output.txt
		if [ $? = 0 ]; then
			PASSFAILJSON="Passed JSON"
		else
			PASSFAILJSON="Failed JSON"
		fi
}

passATOM () 
{
	cat `dirname $0`/file.txt | grep { > output.txt
		if [ $? = 0 ]; then
			PASSFAILATOM="Failed ATOM"
		else
			PASSFAILATOM="Passed ATOM"
		fi
}
