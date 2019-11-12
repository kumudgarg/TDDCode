#!/bin/bash -x
coin1=0
coin2=0
HH=0
TT=0
TH=0
HT=0
headCount=0
tailCount=0
randomNum=0
count=0
count1=0
declare -A coinCount
read -p "how many number will the coin be flipped" flips
function singletCoinComb()
{
	while [ $count -lt $flips ]	
	do	
		randNum=$((RANDOM%2)) 
                 if [ $randNum -eq 1 ]
 		then
   			(( headCount++ ))

		else
			(( tailCount++ ))
		fi
   			(( count++ ))
	done
}
function  singletInfo()
{
 	coinCount[head]=$headCount
 	coinCount[tail]=$tailCount
 	echo "head and tails are " ${sounds[*]}
 	headPerCount=$(( ($headCount*100)/$1 ))
 	tailPerCount=$(( ($tailCount*100)/$1 ))
 }
function flip()
{
	coin1=$1
	coin2=$2
}
function doubletCoinComb()
{
	while [ $count1 -lt $flips ]
	do
		flip $((RANDOM%2)) $((RANDOM%2)) 
		if [ $coin1 -eq 0 ]  && [ $coin2 -eq 0 ]
		then
			(( HH++ ))
		elif [ $coin1 -eq 0 ] && [ $coin2 -eq 1 ]
		then
			(( HT++ ))
		elif [ $coin1 -eq 1 ] && [ $coin2 -eq 0 ]
		then
			(( TH++ ))
		else
			(( TT++ ))
		fi
		(( count1++ ))
	done
}
function PercentageCoin()
{
       	HHPercount=$(( ($HH*100)/$1 ))
        HTPercount=$(( ($HT*100)/$1 ))
        THPercount=$(( ($TH*100)/$1 ))
        TTPercount=$(( ($TT*100)/$1 ))
}
for(( i=0; i <= 1; i++ ))
        do
        {
                #singletCoinComb
                #singletInfo $(( $count ))
                doubletCoinComb
                PercentageCoin $(( $count1 ))
        }

done
