#! /bin/bash
## Script for converting numbers to text-based numbers for text-to-speech friendliness.
val=""
input=$1
##text conversion arrays
one=("nil" "one" "ten" "one hundred" "one thousand") 
two=("nil" "two" "twenty" "two hundred" "two thousand")
three=("nil" "three" "thirty" "three hundred" "three thousand")
four=("nil" "four" "forty" "four hundred" "four thousand")
five=("nil" "five" "fifty" "five hundred" "five thousand")
six=("nil" "six" "sixty" "six hundred" "six thousand") 
seven=("nil" "seven" "seventy" "seven hundred" "seven thousand") 
eight=("nil" "eight" "eighty" "eight hundred" "eight thousand")
nine=("nil" "nine" "ninty" "nine hundred" "nine thousand")
zero=("nil" "" "" "" "")

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

if [[ "$(expr length $input)" == "2" && "$(echo $input|egrep '^1[1-9]$')" != "" ]] 
then
  [[ "$input" == "11" ]] && val="eleven"
  [[ "$input" == "12" ]] && val="twelve"
  [[ "$input" == "13" ]] && val="thirteen"
  [[ "$input" == "14" ]] && val="fourteen"
  [[ "$input" == "15" ]] && val="fifteen"
  [[ "$input" == "16" ]] && val="sixteen"
  [[ "$input" == "17" ]] && val="seventeen"
  [[ "$input" == "18" ]] && val="eighteen"
  [[ "$input" == "19" ]] && val="nineteen"
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
  if [[ "$(expr length $input)" == "2" ]]
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
