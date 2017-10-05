#! /bin/bash
localsecout="/home/pi/Documents/secout/"
rclonesecout="secout:/secout/"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


if [[ $2 == "start" ]] ; then
  # Set up the camera; it likes to disappear on reboot for some reason.
  echo -n "Checking for Video Device on /dev/vid* ... "
  ls -al /dev/vid* && echo "  Video Device Found." || sudo modprobe bcm2835-v4l2
  ls -al /dev/vid* && echo "  Video Device Found." || { echo "  Failed to find a video device." ; exit ; }

  echo "Starting Motion Detection"
  if pgrep motion ; then
    echo "  Looks like motion is already running."
  else
    sudo motion -bc ${DIR}/conf/motion.conf && echo "  Started Motion Capture" || echo "  Failed to start! 0_0"
  fi
elif [[ $2 == "stop" ]] ; then
  sudo killall motion rclone
  sudo chown -R pi. ${localsecout}
  find ${localsecout} -type f -name '*.jpg' | xargs -r jpegoptim
  rclone move ${localsecout} ${rclonesecout}
fi
