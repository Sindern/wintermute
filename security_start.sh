DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Starting Motion Detection"
if pgrep motion ; then
  echo "  Looks like motion is already running."
else
  sudo motion -bc ${DIR}/conf/motion.conf && echo "  Started Motion Capture" || echo "  Failed to start! 0_0"
fi
