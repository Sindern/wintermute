## Kill all open festival and mplayer processes
bldred='\e[1;31m' # Red
txtrst='\e[0m'    # Text Reset

killall aplay 2> /dev/null 1> /dev/null
killall mplayer 2> /dev/null 1> /dev/null
echo -e "\t${bldred})-: Fine, I'm shutting up. :-(${txtrst}"