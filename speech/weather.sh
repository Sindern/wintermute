#! /bin/bash
## Under construction.  Working on getting weather info from command line without an API
wstr=$(lynx --dump http://www.wunderground.com/cgi-bin/findweather/hdfForecast?query=Austin%2C+TX |grep -v "http://" | grep -v "javascript:void" | grep -v "  \* "|sed '1,/  Now/d' | sed 1d | head -n 11 | sed 's|^\s*||g'|sed ':a;N;$!ba;s/\n/@/g')
curcond=$(echo $wstr|cut -d'@' -f1)
curtemp="$(bash conv/num_to_txt.sh $(echo $wstr|cut -d'@' -f3|cut -d'.' -f1)) point $(bash conv/num_to_txt.sh $(echo $wstr|cut -d'@' -f3|cut -d'.' -f2|cut -d' ' -f1))"
feelslike="$(bash conv/num_to_txt.sh $(echo $wstr|cut -d'@' -f4|egrep -o '[0-9]+\.?'))"
wind="$(bash conv/num_to_txt.sh $(echo $wstr|cut -d'@' -f6|cut -d'.' -f1))"
[[ "$wind" == "" ]] && wind="zero"
echo "Currently $curcond and $curtemp fahrenheit. Feels like $feelslike fahrenheit. Wind is at $wind miles per hour."

#Moon is a $(echo $wstr|cut -d'@' -f11)