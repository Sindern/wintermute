#! /bin/bash

if [[ ! -f $HOME/wintermute/wmlisten ]]
  then echo "Weather response triggered, but Wintermute wasn't listening." ; exit
fi

##sample output: Clear@Temperature@69.3 °F@Feels Like 69.3 °F@Wind(mph)@0.0@Sunrise / Set@7:17 AM@7:31 PM@Moon@Waxing Crescent
wstr=$(lynx --dump http://www.wunderground.com/cgi-bin/findweather/hdfForecast?query=Austin%2C+TX |grep -v "http://" | grep -v "javascript:void" | grep -v "  \* "|sed '1,/  Now/d' | sed 1d | head -n 11 | sed 's|^\s*||g'|sed ':a;N;$!ba;s/\n/@/g'|sed 's|°F|fahrenheit|g')

curcond=$(echo $wstr|cut -d'@' -f1)
curtemp="$(echo $wstr|cut -d'@' -f3)"
wind="$(echo $wstr|cut -d'@' -f6|cut -d'.' -f1)"
response="Currently $curcond and $curtemp with wind at $wind miles per hour."
echo "Weather inquiry: $response"
echo $response | festival --tts 2> /dev/null &


#Moon is a $(echo $wstr|cut -d'@' -f11)
#feelslike="$(echo $wstr|cut -d'@' -f4|egrep -o '[0-9]+\.?'|sed 's|\.||g')"