#!/bin/sh

#function to find failure text within output of oacurl command

didThisFail ()
{	
	cat `dirname $0`/file.txt | grep error 
	
	  if [ $? -eq 0 ]; then
   		PASSFAIL="Passed" 
	  else
		cat `dirname $0`/file.txt | grep exception 
			if [ $? -eq 0 ]; then
		  		PASSFAIL="Failed" 
			else
	  			PASSFAIL="Passed" 
			fi
	  fi
}

passJSON () 
{
	cat `dirname $0`/file.txt | grep { > ouput.txt
		if [ $? -eq 0 ]; then
			PASSFAILJSON="Passed JSON"
		else
			cat `dirname $0`/file.txt | grep "<" > output.txt
				if [ $? -eq 0 ]; then
					PASSFAILJSON="Failed JSON"
				else
					PASSFAILJSON="Passed JSON"
				fi
			fi
}

passATOM () 
{
	cat `dirname $0`/file.txt | grep "<" > output.txt
		if [ $? -eq 0 ]; then
			PASSFAILATOM="Passed ATOM"
		else
			cat `dirname $0`/file.txt | grep { > output.txt
				if [ $? -eq 0 ]; then
					PASSFAILATOM="Failed ATOM"
				else
					PASSFAILATOM="Passed ATOM"
				fi
			fi
}
