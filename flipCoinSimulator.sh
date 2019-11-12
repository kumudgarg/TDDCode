#!/bin/bash -x
randomNum=0
 randomNum=$(( RANDOM%2 ))
 if [ $randomNum -eq 1 ]
 then
   	echo "head"

 else
	echo "tails"
fi


 

