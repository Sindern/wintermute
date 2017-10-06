#! /bin/bash

echo -e "Checking for aptitude."
dpkg -l aptitude || { sudo apt-get update ; sudo apt-get -y install aptitude ; }

sudo aptitude update

echo "Checking to see if the packages we need exist."
for package in git motion rclone aptitude jpegoptim mplayer libttspico-utils jq; do
  dpkg -l ${package} || install_packages+=" ${install_packages} "
done

if [[ -n ${install_packages} ]]; then
  echo "  Installing necessary packages."
  sudo aptitude -y install ${install_packages}
else
  echo "  All necessary packages already installed."
fi

if ! grep "^bcm2835-v4l2$" /etc/modules ; then
  echo "bcm2835-v4l2" | sudo tee -a /etc/modules
fi

# Set up the camera
echo -n "Checking for Video Device on /dev/vid* ... "
ls -al /dev/vid* && Echo "Video Device Found."|| sudo modprobe bcm2835-v4l2
ls -al /dev/vid* && echo "Video Device Found." || echo "Failed to find a video device."


# Purging unnecessary packages.
read -p "Delete some big, unnecessary packages to free up space?"

if [[ ${REPLY} =~ ^[Yy] ]] ; then
  sudo aptitude purge chromium-browser libreoffice libreoffice-avmedia-backend-gstreamer libreoffice-base\
     libreoffice-base-core libreoffice-base-drivers libreoffice-calc libreoffice-common  libreoffice-core\
     libreoffice-draw libreoffice-gtk libreoffice-gtk2 libreoffice-impress libreoffice-java-common\
     libreoffice-math libreoffice-report-builder-bin libreoffice-style-galaxy libreoffice-systray\
     libreoffice-writer rpi-chromium-mods libreoffice-sdbc-hsqldb bluej greenfoot wolfram-engine\
     scratch scratch2 squeak-plugins-scratch nuscratch
fi
