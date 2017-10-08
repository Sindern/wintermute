## Weather update daemon.  Update time can be adjusted to fit the API's limits.

# Time between refreshing weather Cache
# Adjust based on WeatherAPI ratelimits.
source ~/.wintermute/wintermute.conf

# Set up the temp cache file and weather API URL to hit.
file="${wm_temp_dir}/weather.json"
weather_api_url="http://api.wunderground.com/api/${weather_api_key}/conditions/q/autoip.json"
if [[ -n ${weather_ip_override} ]]; then
  weather_api_url+="?geo_ip=${weather_ip_override}"
fi

# Check to see how many seconds have elapsed since last cache update.
#   and update the cache file if we need to.
lastupdate=$(expr $(date +%s) - $(stat --format=%Y $file))
if [[ $lastupdate -gt $updateseconds || ! -f $file  ]]; then
  wget -o /dev/null -O $file ${weather_api_url}
fi

if [[ $1 == "summary" ]] ; then
  degF=$(jq -r '.current_observation.temp_f' ${file})
  degF=${degF/./ point }
  wdesc=$(jq -r '.current_observation.weather' ${file})
  curloc=$(jq -r '.current_observation.display_location.city' ${file})
  echo "It is currently ${degF} fahrenheit and ${wdesc} in ${curloc}"
fi






############
