#!/bin/bash
if [ -f '/usr/lib/os-release' ]; then
  . /usr/lib/os-release
else
  touch $HOME'/.sh.lock'
fi

PKG_LIST='gh git python3'

/usr/bin/clear
if [ ! -f $HOME'/.sh.lock' ]; then
  echo "Install packages?(y/N)"
  read result
fi

if [[ $result == 'y' && ! -f "$HOME/.sh.lock" || $result == 'Y' && ! -f "$HOME/.sh.lock" ]]; then
  /usr/bin/clear
  if [[ $NAME == 'Fedora Linux' ]]; then
    touch $HOME'/.sh.lock'
    /usr/bin/sudo /usr/bin/dnf install -y --skip-unavailable $PKG_LIST
  elif [[ $NAME == 'Debian GNU/Linux' || $NAME == 'Ubuntu' ]]; then
    /usr/bin/sudo /usr/bin/apt install -y $PKG_LIST
    touch $HOME'/.sh.lock'
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

if [[ -f '/usr/bin/git' && ! -f $HOME'/.git.lock' ]]; then
  echo "Enter git name"
  read name
  /usr/bin/git config --global user.name $name
  echo "Enter git e-mail"
  read email
  /usr/bin/git config --global user.email $email
  touch $HOME'/.git.lock'
fi

if [ ! -f '/usr/bin/gh' ]; then
  echo "[!] GH is not present"
  exit 1
fi

if [[ -f '/usr/bin/gh' && ! -f $HOME'/.gh.lock' ]]; then
  touch $HOME'/.gh.lock'
  /usr/bin/gh auth login
fi

echo -e "\nScript done!"
exit 0
