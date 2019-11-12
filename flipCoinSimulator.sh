#!/bin/bash -x
headCount=0
tailCount=0
randomNum=0
count=0
declare -A coinCount
read -p "how many number will the coin be flipped" flips
while [ $count -le $flips ]	
do
	randomNum=$(( RANDOM%2 ))
 	if [ $randomNum -eq 1 ]
 		then
   		(( headCount++ ))

	else
			(( tailCount++ ))
	fi
   		(( count++ ))
done
coinCount[head]=$headCount
coinCount[tail]=$tailCount
echo "head and tails are " ${sounds[@]}
headPerCount=$(( ($headCount*100)/$count ))
tailPerCount=$(( ($tailCount*100)/$count ))


 

