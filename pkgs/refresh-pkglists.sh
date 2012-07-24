#!/bin/sh

#raw lists
pacman -Qeq | sort > /tmp/pacman-Qeq-list
pacman -Qmq | sort > /tmp/pacman-Qmq-list

#simple lists
comm -23 /tmp/pacman-Qeq-list /tmp/pacman-Qmq-list | sort > pkglist.full
comm -12 /tmp/pacman-Qeq-list /tmp/pacman-Qmq-list | sort > aur-pkglist

#specialised lists
pacman -Rcs -p --print-format "%n" libx11 $(grep xorg pkglist.full) $(grep xf86 pkglist.full) | sort > /tmp/pacman-Rcs-x11-list
comm -12 pkglist.full /tmp/pacman-Rcs-x11-list | sort > pkglist.x
comm -23 pkglist.full pkglist.x | sort > pkglist.nox
cat pkglist.full | grep -v darktable | grep -v libreoffice | grep -v texlive | sort > pkglist
cat pkglist.full | grep darktable | sort > pkglist.darktable
cat pkglist.full | grep libreoffice | sort > pkglist.libreoffice
cat pkglist.full | grep texlive | sort > pkglist.texlive

#checking results are coherent
cat pkglist.x pkglist.nox | sort > /tmp/pkglist.x-and-nox
if ! [ $(diff /tmp/pkglist.x-and-nox pkglist.full | wc -l) -eq "0" ]
then
  echo "pkglist.full ≠ pkglist.x ∪ pkglist.nox"
fi
if ! [ $(comm -12 pkglist.x pkglist.nox | wc -l) -eq "0" ]
then
  echo "pkglist.x ∩ pkglist.nox ≠ ∅ "
fi
