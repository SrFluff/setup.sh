#!/bin/bash

PKG_LIST='gh git python3'
/usr/bin/clear
echo "Install packages?(y/N)"
read result

if [[ $result == 'y' || $result == 'Y' ]]; then
  /usr/bin/clear
  echo -e "Distro:\n1. Debian\n2. Fedora\n3. Cancel\n"
  read result
  if [ $result == "1" ]; then
    /usr/bin/sudo /usr/bin/apt install -y $PKG_LIST
  elif [ $result == "2" ]; then
    /usr/bin/sudo /usr/bin/dnf install -y --skip-unavailable $PKG_LIST
  elif [ $result == "3" ]; then
    echo "Package install canceled"
  fi
fi

if [ ! -d $HOME'/python' ]; then
  mkdir $HOME'/python'
fi

if [ ! -d $HOME'/sh' ]; then
  mkdir $HOME'/sh'
fi

if [ ! -d $HOME'/C' ]; then
  mkdir $HOME'/C'
fi

if [ ! -f '/usr/bin/git' ]; then
  echo "[!] Git is not present"
  exit 1
fi

if [ -f '/usr/bin/git' ]; then
  echo "Enter git name"
  read name
  /usr/bin/git config --global user.name $name
  echo "Enter git e-mail"
  read email
  /usr/bin/git config --global user.email $email
fi

if [ ! -f '/usr/bin/gh' ]; then
  echo "[!] GH is not present"
  exit 1
fi

if [ -f '/usr/bin/gh' ]; then
  /usr/bin/gh auth login
fi

echo -e "\nScript done!"
exit 0
