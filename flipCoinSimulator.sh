#!/bin/bash -x
coin1=0
coin2=0
HH=0
TT=0
TH=0
HT=0
TTT=0
HHH=0
HHT=0
TTH=0
HTT=0
THH=0
THT=0
HTH=0
headCount=0
tailCount=0
randomNum=0
count=0
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
	coin3=$3
}
function doubletCoinComb()
{
	while [ $count -lt $flips ]
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
		(( count++ ))
	done
}
function PercentageCoin()
{
       	HHPercount=$(( ($HH*100)/$1 ))
        HTPercount=$(( ($HT*100)/$1 ))
        THPercount=$(( ($TH*100)/$1 ))
        TTPercount=$(( ($TT*100)/$1 ))
}
function tripletCoinComb()
{
        while [ $count -lt $flips ]
        do
                flip $((RANDOM%2)) $((RANDOM%2)) $((RANDOM%2)) 
                if [ $coin1 -eq 0 ]  && [ $coin2 -eq 0 ] && [ $coin3 -eq 0 ]
                then
                        (( HHH++ ))
                elif [ $coin1 -eq 0 ] && [ $coin2 -eq 1 ] && [ $coin3 -eq 0 ]
                then
                        (( HTH++ ))
                elif [ $coin1 -eq 1 ] && [ $coin2 -eq 0 ] && [ $coin3 -eq 1 ]
                then
                        (( THT++ ))
		elif [ $coin1 -eq 1 ] && [ $coin2 -eq 1 ] && [ $coin3 -eq 0 ]
                then
                        (( TTH++ ))
		elif [ $coin1 -eq 0 ] && [ $coin2 -eq 1 ] && [ $coin3 -eq 1 ]
                then
                        (( HTT++ ))
		elif [ $coin1 -eq 1 ] && [ $coin2 -eq 0 ] && [ $coin3 -eq 0 ]
                then
                        (( THH++ ))
		elif [ $coin1 -eq 0 ] && [ $coin2 -eq 0 ] && [ $coin3 -eq 1 ]
                then
                        (( HHT++ ))
		
                else
                        (( TTT++ ))
                fi
	  	(( count++ ))
        done
}

		
function tripletPercentageCoin()
{
        HHHPercount=$(( ($HHH*100)/$1 ))
        HTHPercount=$(( ($HTH*100)/$1 ))
        THHPercount=$(( ($THH*100)/$1 ))
        TTHPercount=$(( ($TTH*100)/$1 ))
	THTPercount=$(( ($THT*100)/$1 ))
	HTTPercount=$(( ($HTT*100)/$1 ))
	HHTPercount=$(( ($HHT*100)/$1 ))
	TTTPercount=$(( ($TTT*100)/$1 ))

}

for(( i=0; i <= 1; i++ ))
        do
        {
                #singletCoinComb
                #singletInfo $(( $count ))
                #doubletCoinComb
               	#PercentageCoin $(( $count ))
		tripletCoinComb
		tripletPercentageCoin $(( $count ))
		
        }

done

