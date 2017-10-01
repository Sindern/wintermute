#! /bin/bash

lock=/tmp/rclone_running

if [[ ! -f ${lock}  ]] ; then
   touch ${lock}
   jpegoptim /home/pi/Documents/secout/*
   rclone move /home/pi/Documents/secout/ secout:/secout/
   rm ${lock}
fi
