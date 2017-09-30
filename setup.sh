#! /bin/bash

#Check to see if the packages we need exist.

for package in git motion ; do
  dpkg -l ${package} || install_packages+=" ${install_packages} "
done

#Install the packages that were missing.
if [[ -n ${install_packages}]]; then
  sudo apt-get install ${install_packages}
fi
