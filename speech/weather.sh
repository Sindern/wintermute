## Weather update daemon.  Update time can be adjusted to fit the API's limits. 

## Wintermute listening test.
bldylw='\e[1;33m' # Yellow
txtrst='\e[0m'    # Text Reset
if [[ ! -f $HOME/wintermute/wmlisten && "$1" != "debug" ]]
  then echo -e "\t${bldylw}Weather response triggered, but Wintermute wasn't listening.${txtrst}" ; exit
fi

updateseconds=300 # amount of time to wait between updates to stay within Weather Underground's free API limit.

## Color variables
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Green
bldblu='\e[1;34m' # Blue
bldwht='\e[1;37m' # White

## Grab the update file to tmp dir if it doesn't exist or it's been more than $updateseconds since last update.
[[ ! -d $HOME/tmp/wintermute/ ]] &&  mkdir -p $HOME/tmp/wintermute/
file="$HOME/tmp/wintermute/Austin.json"
lastupdate=$(expr $(date +%s) - $(stat --format=%Y $file))
if [[ $lastupdate -gt $updateseconds || ! -f $file  ]]
 then wget -O $file http://api.wunderground.com/api/a78ff389f1302f7b/conditions/q/TX/Austin.json 2> /dev/null 1> /dev/null
  echo -e "${bldblu}--==(Updating with the latest weather.)==--\n\t${bldwht}(last update $lastupdate sec ago) ${txtrst}"
else echo -e "${bldblu}--==(Displaying Cached Weather Data)==--\n\t${bldwht}(last update $lastupdate sec ago) ${txtrst}"
fi
## Grab the information we want to display using grep with perl lookahead/lookbehinds and -o to display only what we need
city=$(grep -Po "(?<=\"city\":\").*(?=\",)" $file | head -n 1)
state=$(grep -Po "(?<=\"state_name\":\").*(?=\",)" $file|head -n 1)
weather=$(grep -Po "(?<=\"weather\":\").*(?=\",)" $file|head -n 1)
temp=$(grep -Po "(?<=\"temp_f\":).*(?=,)" $file|head -n 1)
humidity=$(grep -Po "(?<=\"relative_humidity\":\").*(?=\",)" $file|head -n 1 | sed 's|%| percent|g')
windstring=$(grep -Po "(?<=\"wind_string\":\").*(?=\",)" $file|head -n 1)
winddir=$( grep -Po "(?<=\"wind_dir\":\").*(?=\",)" $file|head -n 1)
windmph=$(grep -Po "(?<=\"wind_mph\":).*(?=,)" $file|head -n 1)
windgustmph=$(grep -Po "(?<=\"wind_gust_mph\":).*(?=,)" $file|head -n 1)

#formulate a response and echo it to festival
response="Weather is $weather in $city $state. Temperature is $temp fahrenheit with $humidity humidity.  There is a $windstring wind from the $winddir at $windmph miles per hour, gusting to $windgustmph miles per hour."
echo $response | festival --tts 2> /dev/null &
#and print out some pretty shit to the terminal.
echo -e "\n\t${bldblu}Weather for $city, $state.${txtrst}"
echo -e "${bldgrn}Weather:\t${txtgrn}$weather${txtrst}"
echo -e "${bldgrn}Temperature:\t${txtgrn}$temp${txtrst}"
echo -e "${bldgrn}Humidity:\t${txtgrn}$humidity${txtrst}"
echo -e "${bldgrn}Wind Info:\t${txtgrn}$windstring from the $winddir${txtrst}"
echo -e "${bldgrn}WindSpeed:\t${txtgrn}$windmph mph (gust $windgustmph mph)${txtrst}"
echo
