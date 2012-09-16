#! /bin/bash

#Return the time in a TTS friendly manner

if [[ "$(date +%H)" == "00" ]]
 then hour="midnight"
elif [[ "$(date +%H)" == "12" ]]
 then hour="noon"
elif [[ "$(date +%H)" -gt "12" ]]
 then hour="$(conv/num_to_txt.sh $(date +%I))"
  ampm="PM"
else hour="$(conv/num_to_txt.sh $(date +%H))"
  ampm="AM"
fi
minute="$(conv/num_to_txt.sh $(date +%M))"
seconds="$(conv/num_to_txt.sh $(date +%S))"

response="It is $hour $minute $ampm plus $seconds seconds"
echo $response