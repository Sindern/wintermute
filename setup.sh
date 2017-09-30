#! /bin/bash

echo "Checking to see if the packages we need exist."
for package in git motion ; do
  dpkg -l ${package} || install_packages+=" ${install_packages} "
done

if [[ -n ${install_packages}]]; then
  echo "Installing necessary packages."
  sudo apt-get install ${install_packages}
else
  echo "All necessary packages already installed."
fi

# Set up the camera
echo "Checking for Video Device on /dev/vid*"
ls -al /dev/vid* && Echo "Video Device Found."|| sudo modprobe bcm2835-v4l2
ls -al /dev/vid* && echo "Video Device Found." || echo "Failed to find a video device."
