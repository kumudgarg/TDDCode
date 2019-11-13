#!/bin/bash -x
bets=0
stake=0
bets=0
read -p "Insert days for playing" day
read -p "number of game" game
for (( i=0; i < $day; i++ ))
do
	(( stake=$(( stake+100 )) ))
	for (( j=0; j < $game; j++ ))
	do
		 (( bets++ ))
		if [ $stake -eq 0 ]
		then
			break
		else
			(( stake-- ))	
		fi
		
	done
done
echo "total bets are $bets " 
echo "total stake is $stake "
