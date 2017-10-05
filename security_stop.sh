#! /bin/bash

sudo killall motion rclone
sudo chown -R pi. /home/pi/Documents/secout/
find /home/pi/Documents/secout/ -type f -name '*.jpg' | xargs -r jpegoptim
rclone move /home/pi/Documents/secout/ secout:/secout/
