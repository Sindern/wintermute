#! /bin/bash

lock=/tmp/rclone_running

if [[ ! -f ${lock}  ]] ; then
   touch ${lock}
   rclone move /home/pi/Documents/secout/ secout:/secout/
   rm ${lock}
fi
