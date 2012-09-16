#! /bin/bash
## Script for converting numbers to ordinal numbers for text-to-speech friendliness.
val=""
input=$1
##text conversion arrays
one=("nil" "first" "ten" "one hundred" "one thousand") 
two=("nil" "second" "twenty" "two hundred" "two thousand")
three=("nil" "third" "thirty" "three hundred" "three thousand")
four=("nil" "fourth" "forty" "four hundred" "four thousand")
five=("nil" "fifth" "fifty" "five hundred" "five thousand")
six=("nil" "sixth" "sixty" "six hundred" "six thousand") 
seven=("nil" "seventh" "seventy" "seven hundred" "seven thousand") 
eight=("nil" "eighth" "eighty" "eight hundred" "eight thousand")
nine=("nil" "ninth" "ninty" "nine hundred" "nine thousand")
zero=("nil" "ith" "" "" "")

function numconv() { 
  [[ "$1" == "1" ]] && echo ${one[$2]}
  [[ "$1" == "2" ]] && echo ${two[$2]}
  [[ "$1" == "3" ]] && echo ${three[$2]}
  [[ "$1" == "4" ]] && echo ${four[$2]}
  [[ "$1" == "5" ]] && echo ${five[$2]}
  [[ "$1" == "6" ]] && echo ${six[$2]}
  [[ "$1" == "7" ]] && echo ${seven[$2]}
  [[ "$1" == "8" ]] && echo ${eight[$2]}
  [[ "$1" == "9" ]] && echo ${nine[$2]}
  [[ "$1" == "0" ]] && echo ${zero[$2]}
}

## conversion digit position

if [[ "$(expr length $input)" == "2" && "$(echo $input|egrep '^1[0-9]$')" != "" ]] 
then
  [[ "$input" == "10" ]] && val="tenth"
  [[ "$input" == "11" ]] && val="eleventh"
  [[ "$input" == "12" ]] && val="twelfth"
  [[ "$input" == "13" ]] && val="thirteenth"
  [[ "$input" == "14" ]] && val="fourteenth"
  [[ "$input" == "15" ]] && val="fifteenth"
  [[ "$input" == "16" ]] && val="sixteenth"
  [[ "$input" == "17" ]] && val="seventeenth"
  [[ "$input" == "18" ]] && val="eighteenth"
  [[ "$input" == "19" ]] && val="nineteenth"
else
  if [[ "$(expr length $input)" == "4" ]]
  then
    val="$val $(numconv $(echo $input|head -c 1) 4)"
    input=$(echo $input|tail -c 4)
  fi
  if [[ "$(expr length $input)" == "3" ]]
  then 
    val="$val $(numconv $(echo $input|head -c 1) 3)"
    input=$(echo $input|tail -c 3)
  fi
  if [[ "$(expr length $input)" == "2"  ]]
  then 
    val="$val $(numconv $(echo $input|head -c 1) 2)"
    input=$(echo $input|tail -c 2)
  fi
  if [[ "$(expr length $input)" == "1" ]]
  then 
    val="$val $(numconv $(echo $input|head -c 1) 1)"
  fi
fi
echo $val
