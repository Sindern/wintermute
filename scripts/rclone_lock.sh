#! /bin/bash

lock=/tmp/rclone_running

if [[ ! -f ${lock}  ]] ; then
   touch ${lock}
#   sudo chown -R pi. /home/pi/Documents/secout/
#   jpegoptim /home/pi/Documents/secout/*
   rclone move /home/pi/Documents/secout/ secout:/secout/
   rm ${lock}
fi
