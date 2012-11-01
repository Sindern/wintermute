#! /bin/bash

## Wintermute listening test.
bldylw='\e[1;33m' # Yellow
txtrst='\e[0m'    # Text Reset
if [[ ! -f $HOME/wintermute/wmlisten && "$1" != "debug" ]]
  then echo -e "\t${bldylw}Ponies response triggered, but Wintermute wasn't listening.${txtrst}" ; exit
fi

#some colors for the output
bldpur='\e[1;35m' # Purple
bldblu='\e[1;34m' # Blue

## Get the hour, minutes, and seconds till the next episode of ponies in a TTS-friendly manner
timetill=$(curl http://ponycountdown.com | grep "unknown" | cut -d'>' -f2 | cut -d'<' -f1)
## Need to parse this into something readable by TTS.


## Output to festival & to terminal 
response="New pony episode in $timetill"
echo $response | festival --tts 2> /dev/null &
echo -e "\n\t${bldblu}New Pony Episode in: ${bldpur}$(date +%T)${txtrst}\n"
