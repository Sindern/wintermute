#! /bin/bash
#Return the time in a TTS friendly manner
if [[ ! -f $HOME/wintermute/wmlisten ]]
  then echo "Time response triggered, but Wintermute wasn't listening." ; exit
fi

if [[ "$(date +%H)" == "00" ]]
 then hour="midnight"
elif [[ "$(date +%H)" == "12" ]]
 then hour="noon"
elif [[ "$(date +%H)" -gt "12" ]]
 then hour="$(conv/num_to_txt.sh $(date +%I))"
  ampm="pee ehm"
else hour="$(conv/num_to_txt.sh $(date +%H))"
  ampm="ae ehm"
fi
minute="$(conv/num_to_txt.sh $(date +%M))"
seconds="$(conv/num_to_txt.sh $(date +%S))"

response="It is $hour $minute $ampm , $seconds seconds"
echo "Time Query: $response"
echo $response | festival --tts 2> /dev/null &
