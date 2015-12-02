#! /bin/bash
if [ ! -f /home/vagrant/already-installed-flag ]
then
  echo "ADD EXTRA ALIAS VIA .bashrc"
  cat /vagrant/bashrc.alias.sh >> /home/vagrant/.bashrc

  # Add -qq for no output
  echo "**** GENERAL APT-GET UPDATE ****"
  apt-get -q -y update
  
  echo "**** INSTALLING DEFAULT PACKAGES ****"
  apt-get -q -y install git vim unzip screen 
  
  echo "**** INSTALLING NODE 5.x ****"
  curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
  sudo apt-get install -y nodejs

  touch /home/vagrant/already-installed-flag
  echo "Done!"
else
  echo "already installed flag set : /home/vagrant/already-installed-flag"
fi