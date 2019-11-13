#!/bin/bash -x
bets=0
stake=0
bets=0
win=0
loose=0
read -p "Insert days for playing" day
read -p "number of game" game
read -p "Insert win/loose percent" stakepercent
for (( i=0; i < $day; i++ ))
do
	(( stake=$(( stake+100 )) ))
	for (( j=0; j < $game; j++ ))
	do
		randNum=$(( RANDOM%2 ))
		 (( bets++ ))
		if [ $stake -eq 0 ]
		then
			break
		elif [ $randNum -eq 1 ]
		then
			(( win++ ))
			(( stake++ ))
		else
			(( loose++ ))
			(( stake-- ))	
		fi
		stackAmountWin=$(( stackpercent + 100 ))
		stackAmountLoose=$(( 100 - stackpercent ))
		winLimit=$(( ($stake * $stackAmountWin) / 100 ))
		LooseLimit=$(( ($stake * $stackAmountLoose) / 100 ))
		if [ $win -eq $winLimit ]
        	then 
                	break
		elif [ $loose -eq $LooseLimit ]
		then
			break
		else
                	continue
        	fi

	done
done
echo "total bets are $bets " 
echo "total stake is $stake "
echo "total win times $win "
echo "total  loose times $loose "
