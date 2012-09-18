#! /bin/bash
## Working on a voice-commanded, speaking home-automation setup.
#Starting point is a fully-updated #! (crunchbang) 11.0 Waldorf X64
##Install some dependencies
sudo apt-get -y install linux-headers-$(uname -r) python-gst0.10 python-libxml2 gstreamer-tools gstreamer0.10-tools pkg-config lynx

##Get the files we'll need for setup. 
sudo wget http://voximp.googlecode.com/files/pocketsphinx-0.5-1-i686.pkg.tar.gz
sudo wget http://voximp.googlecode.com/files/voximp-0.0.1.tar.gz

#Install voximp
sudo tar -zxvf voximp-0.0.1.tar.gz
[[ "$(uname -m)" == "x86_64" ]] && sudo sed -i 's|alsasrc|pulsesrc|g' voximp.py
sudo mv voximp.py /usr/bin/voximp
sudo mkdir -p ~/.config/voximp/
sudo mv sample_configs/* ~/.config/voximp/
sudo mv ~/.config/voximp/voximpconf.py{.sample,}

#install pocketsphinx
sudo tar -zxvf pocketsphinx-0.5-1-i686.pkg.tar.gz
sudo cp -r usr/* /usr/

#install gstreamer-pocketsphinx from Ubuntu repo since it's note in #!'s repos >_<
if [[ "$(uname -m)" == "x86_64" ]]
then 
  sudo wget http://ubuntu.wallawalla.edu/ubuntu//pool/universe/s/sphinxbase/libsphinxbase1_0.4.1-0ubuntu1_amd64.deb
  sudo wget http://mirrors.us.kernel.org/ubuntu//pool/universe/p/pocketsphinx/libpocketsphinx1_0.5.1+dfsg1-0ubuntu2_amd64.deb
  sudo wget http://security.ubuntu.com/ubuntu/pool/universe/p/pocketsphinx/gstreamer0.10-pocketsphinx_0.5.1+dfsg1-0ubuntu3_amd64.deb
  sudo dpkg -i libsphinxbase1_0.4.1-0ubuntu1_amd64.deb
  sudo dpkg -i libpocketsphinx1_0.5.1+dfsg1-0ubuntu2_amd64.deb
  sudo dpkg -i gstreamer0.10-pocketsphinx_0.5.1+dfsg1-0ubuntu3_amd64.deb
else 
  sudo wget http://mirror.pnl.gov/ubuntu//pool/universe/s/sphinxbase/libsphinxbase1_0.4.1-0ubuntu1_i386.deb
  sudo dpkg -i libsphinxbase1_0.4.1-0ubuntu1_i386.deb
  sudo wget http://mirror.pnl.gov/ubuntu//pool/universe/p/pocketsphinx/libpocketsphinx1_0.5.1+dfsg1-0ubuntu3_i386.deb
  sudo dpkg -i libpocketsphinx1_0.5.1+dfsg1-0ubuntu3_i386.deb
  sudo wget http://mirror.pnl.gov/ubuntu//pool/universe/p/pocketsphinx/gstreamer0.10-pocketsphinx_0.5.1+dfsg1-0ubuntu1_i386.deb
  sudo dpkg -i gstreamer0.10-pocketsphinx_0.5.1+dfsg1-0ubuntu1_i386.deb
fi
## To add : wget/install modified voximp config


## Configure voximp
cd ~/documents
voximp -c

## Now install Festival and a voice for it so we can have the computer talk back to us: 
sudo apt-get -y install alsa-oss festival festlex-cmu festlex-poslex festvox-kallpc16k libestools2.0 oss-compat 

# clean up installation garbage
sudo rm -rf gstreamer0.10-pocketsphinx_0.5.1+dfsg1-0ubuntu3_amd64.deb libpocketsphinx1_0.5.1+dfsg1-0ubuntu2_amd64.deb libsphinxbase1_0.4.1-0ubuntu1_amd64.deb .PKGINFO pocketsphinx-0.5-1-i686.pkg.tar.gz sample_configs voximp-0.0.1.tar.gz usr












