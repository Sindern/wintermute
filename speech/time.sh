#! /bin/bash

## Wintermute listening test.
bldylw='\e[1;33m' # Yellow
txtrst='\e[0m'    # Text Reset
if [[ ! -f $HOME/wintermute/wmlisten && "$1" != "debug" ]]
  then echo -e "\t${bldylw}Time response triggered, but Wintermute wasn't listening.${txtrst}" ; exit
fi

#some colors for the output
bldpur='\e[1;35m' # Purple
bldblu='\e[1;34m' # Blue

## Get the hour, minutes, and seconds in a TTS-friendly manner
if [[ "$(date +%H)" == "00" ]]
 then hour="midnight"
elif [[ "$(date +%H)" == "12" ]]
 then hour="noon"
elif [[ "$(date +%H)" -gt "12" ]]
 then hour="$(date +%I|sed 's|^0||g')"
  ampm="pee ehm"
else hour="$(date +%H|sed 's|^0||g')"
  ampm="ae ehm"
fi
minute="$(date +%M|sed 's|^0|o |g')"
seconds="$($HOME/wintermute/speech/conv/num_to_txt.sh $(date +%S))"

## Output to festival & to terminal 
response="It is $hour $minute $ampm , $seconds seconds"
echo $response | festival --tts 2> /dev/null &
echo -e "\n${bldblu}   The current time is: ${bldpur}$(date +%T)${txtrst}\n"