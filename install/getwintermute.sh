#! /bin/bash
## Working on a voice-commanded, speaking home-automation setup.
#Starting point is a fully-updated #! (crunchbang) 11.0 Waldorf X64
##Install some dependencies
sudo aptitude -y install linux-headers-$(uname -r)
sudo aptitude -y install python-gst0.10 python-libxml2 gstreamer-tools gstreamer0.10-tools pkg-config lynx




##Install Pocketsphinx if it's not there.
if [[ ! -f /usr/bin/pocketsphinx_test ]]
 then wget http://voximp.googlecode.com/files/pocketsphinx-0.5-1-i686.pkg.tar.gz
  tar -zxvf pocketsphinx-0.5-1-i686.pkg.tar.gz
  sudo cp -r usr/* /usr/
fi
#Install voximp if it's not there.
if [[ ! -f /usr/bin/voximp ]]
 then wget http://voximp.googlecode.com/files/voximp-0.0.1.tar.gz
  tar -zxvf voximp-0.0.1.tar.gz
  [[ "$(uname -m)" == "x86_64" ]] && sudo sed -i 's|alsasrc|pulsesrc|g' voximp.py
  sudo mv voximp.py /usr/bin/voximp
  mkdir -p ~/.config/voximp/
  mv sample_configs/* ~/.config/voximp/
  mv ~/.config/voximp/voximpconf.py{.sample,}
fi

#install gstreamer-pocketsphinx from Ubuntu repo since it's note in #!'s repos >_< (if not installed)
if [[ "$(uname -m)" == "x86_64" ]]
then 
  if [[ "$(dpkg -s libsphinxbase1 | grep 'install ok installed')" == "" ]]
   then wget http://ubuntu.wallawalla.edu/ubuntu//pool/universe/s/sphinxbase/libsphinxbase1_0.4.1-0ubuntu1_amd64.deb
    sudo dpkg -i libsphinxbase1_0.4.1-0ubuntu1_amd64.deb
  fi
  if [[ "$(dpkg -s libpocketsphinx1 | grep 'install ok installed')" == "" ]]
   then wget http://mirrors.us.kernel.org/ubuntu//pool/universe/p/pocketsphinx/libpocketsphinx1_0.5.1+dfsg1-0ubuntu2_amd64.deb
    sudo dpkg -i libpocketsphinx1_0.5.1+dfsg1-0ubuntu2_amd64.deb
  fi
  if [[ "$(dpkg -s gstreamer0.10-pocketsphinx | grep 'install ok installed')" == "" ]]
   then wget http://security.ubuntu.com/ubuntu/pool/universe/p/pocketsphinx/gstreamer0.10-pocketsphinx_0.5.1+dfsg1-0ubuntu3_amd64.deb
    sudo dpkg -i gstreamer0.10-pocketsphinx_0.5.1+dfsg1-0ubuntu3_amd64.deb
  fi
else
  if [[ "$(dpkg -s libsphinxbase1 | grep 'install ok installed')" == "" ]]
   then wget http://mirror.pnl.gov/ubuntu//pool/universe/s/sphinxbase/libsphinxbase1_0.4.1-0ubuntu1_i386.deb
    sudo dpkg -i libsphinxbase1_0.4.1-0ubuntu1_i386.deb
  fi
  if [[ "$(dpkg -s libpocketsphinx1 | grep 'install ok installed')" == "" ]]
   then wget http://mirror.pnl.gov/ubuntu//pool/universe/p/pocketsphinx/libpocketsphinx1_0.5.1+dfsg1-0ubuntu3_i386.deb
    sudo dpkg -i libpocketsphinx1_0.5.1+dfsg1-0ubuntu3_i386.deb
  fi
  if [[ "$(dpkg -s gstreamer0.10-pocketsphinx | grep 'install ok installed')" == "" ]]
   then wget http://mirror.pnl.gov/ubuntu//pool/universe/p/pocketsphinx/gstreamer0.10-pocketsphinx_0.5.1+dfsg1-0ubuntu1_i386.deb
    sudo dpkg -i gstreamer0.10-pocketsphinx_0.5.1+dfsg1-0ubuntu1_i386.deb
  fi
fi

## Now install Festival and a voice for it so we can have the computer talk back to us: 
sudo aptitude -y install alsa-oss festival festlex-cmu festlex-poslex festvox-kallpc16k libestools2.0 oss-compat 

# clean up installation garbage
rm -rf gstreamer0.10-pocketsphinx_0.5.1+dfsg1-0ubuntu3_amd64.deb libpocketsphinx1_0.5.1+dfsg1-0ubuntu2_amd64.deb libsphinxbase1_0.4.1-0ubuntu1_amd64.deb .PKGINFO pocketsphinx-0.5-1-i686.pkg.tar.gz sample_configs voximp-0.0.1.tar.gz usr
echo -e "\n To clean up the junk files, run \n rm -rf gstreamer0.10-pocketsphinx_0.5.1+dfsg1-0ubuntu3_amd64.deb libpocketsphinx1_0.5.1+dfsg1-0ubuntu2_amd64.deb libsphinxbase1_0.4.1-0ubuntu1_amd64.deb .PKGINFO pocketsphinx-0.5-1-i686.pkg.tar.gz sample_configs voximp-0.0.1.tar.gz usr\n"