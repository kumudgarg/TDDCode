#!/bin/bash -x

echo "welcome"
read -p "how much time you flip coin " flips
read -p "how many coins " coinNum
declare -A result

headCount=0
tailCount=0
TT=0
HH=0
TH=0
HT=0

function coin() {
for (( i=1; i<=$flips; i++ ))
do
string=""
 for(( j=0; j<$coinNum; j++ ))
 do
    coinTurn=$(( RANDOM % 2 ))

      if [ $coinTurn == 1 ]
then
   string=$string"H"
           headCount=$(( $headCount + 1 ))
else
            string=$string"T"
           tailCount=$(( $tailCount + 1 ))
fi
 done
echo final key : $string
result["$string"]=$(( ${result["$string"]} + 1 ))   
done
}
coin
echo ${!result[@]}
echo ${result[@]}
