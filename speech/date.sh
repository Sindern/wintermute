#! /bin/bash

## Wintermute listening test.
bldylw='\e[1;33m' # Yellow
txtrst='\e[0m'    # Text Reset
if [[ ! -f $HOME/wintermute/wmlisten && "$1" != "debug" ]]
  then echo -e "\t${bldylw}Date response triggered, but Wintermute wasn't listening.${txtrst}" ; exit
fi

#some colors for the output
bldpur='\e[1;35m' # Purple
bldblu='\e[1;34m' # Blue

##Return the values to festival & terminal
today="$(date "+%B %d, %Y")"
echo "Today is $today." | festival --tts 2> /dev/null &
echo -e "\n${bldblu}Today is: ${bldpur}${today}${txtrst}\n"