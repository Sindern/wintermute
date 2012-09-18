#! /bin/bash

if [[ ! -f $HOME/wintermute/wmlisten ]]
  then echo "Date response triggered, but Wintermute wasn't listening." ; exit
fi

if [[ "$(echo $(date +%Y)|egrep "^20")" == "" ]]
  then year="$(conv/num_to_txt.sh $(date +%Y))"
else year="twenty $(conv/num_to_txt.sh $(date +%y))"
fi
month="$(date +%B)"
day="$(bash conv/num_to_ord.sh $(date +%d|sed 's|^0||g'))"

today="$month $day, $year"
echo "Returned date: $today"
echo "Today is $today." | festival --tts 2> /dev/null &
