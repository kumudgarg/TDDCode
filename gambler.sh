#!/bin/bash 
bets=0
stake=0
bets=0
win=0
loose=0
countWin=0
countLoose=0
declare -A  dayNum
read -p "Insert days for playing" day
read -p "number of game" game
read -p "Insert win/loose percent" stakepercent
for (( i=0; i < $day; i++ ))
do
	(( stake=$(( stake+100 )) ))
	stackAmountWin=$(( stakepercent + 100 ))
        stackAmountLoose=$(( 100 - stakepercent ))
        winLimit=$(( ($stake * $stackAmountWin) / 100 ))
        LooseLimit=$(( ($stake * $stackAmountLoose) / 100 ))
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
		if [ $win -ge $winLimit ]
	        then 
	                break
	        elif [ $LooseLimit -le $loose ]
	        then
	                break
	        else
	                echo "continue gambler's day"
	        fi
	done
	countWin=$(( $win - $countWin ))
	countLoose=$(( $loose - $countLoose ))
	dayNum["Day $i"]="day $i -> win=$countWin, loose=$countLoose : "
	
done
echo "total bets are $bets " 
echo "total stake is $stake "
echo "total win times $win "
echo "total loose times $loose "
echo "All 20 day win loose amount are" ${dayNum[@]} 
