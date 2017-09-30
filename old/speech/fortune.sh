## Simple fortune return for fun. :P 

## Wintermute listening test.
bldylw='\e[1;33m' # Yellow
txtrst='\e[0m'    # Text Reset
if [[ ! -f $HOME/wintermute/wmlisten && "$1" != "debug" ]]
  then echo -e "\t${bldylw}Weather response triggered, but Wintermute wasn't listening.${txtrst}" ; exit
fi

#colors for output
bldpur='\e[1;35m' # Purple
bldblu='\e[1;34m' # Blue

fortune=$(fortune|sed 's|A:|answer,|g'|sed 's|Q:|question,|g'|sed ':a;N;$!ba;s/\n/ /g'|sed 's| +| |g'|sed 's|\\t| |g')
echo $fortune | festival --tts 2> /dev/null &
echo -e "${bldblu}Your fortune: ${bldpur}$fortune${txtrst}"