DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Set up the camera; it likes to disappear on reboot for some reason.
echo -n "Checking for Video Device on /dev/vid* ... "
ls -al /dev/vid* && Echo "Video Device Found."|| sudo modprobe bcm2835-v4l2
ls -al /dev/vid* && echo "Video Device Found." || echo "Failed to find a video device."

echo "Starting Motion Detection"
if pgrep motion ; then
  echo "  Looks like motion is already running."
else
  sudo motion -bc ${DIR}/conf/motion.conf && echo "  Started Motion Capture" || echo "  Failed to start! 0_0"
fi
