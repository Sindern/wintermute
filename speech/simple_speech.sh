

speak_time() {
  curtime=$(date "+%-H %M")
  display_text="It is ${curtime/ /:}."
  curtime=${curtime/ 0/ oh}
  speak_text="It is ${curtime}."
}

speak_date(){
  speak_text="Today is $(date '+%h %d')."
  display_text=${speak_text}
}

case $1 in
  time) speak_time ;;
  date) speak_date ;;
esac

echo "Display:" ${display_text}
echo "Speak  :" ${speak_text}
