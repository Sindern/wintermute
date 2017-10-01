#! /bin/bash

sudo killall motion
sudo chown -R pi. /home/pi/Documents/secout/
jpegoptim /home/pi/Documents/secout/*
rclone move /home/pi/Documents/secout/ secout:/secout/
