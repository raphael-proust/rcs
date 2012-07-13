#!/bin/sh

pacman -Qeq | sort > /tmp/pacman-Qeq-list
pacman -Qmq | sort > /tmp/pacman-Qmq-list
pacman -Rcs -p --print-format "%n" libx11 | sort > /tmp/pacman-Rcs-x11-list
comm -23 /tmp/pacman-Qeq-list /tmp/pacman-Qmq-list > pkglist.full
comm -12 /tmp/pacman-Qeq-list /tmp/pacman-Qmq-list > aur-pkglist
comm -12 pkglist.full /tmp/pacman-Rcs-x11-list > pkglist.x
comm -23 pkglist.full /tmp/pacman-Rcs-x11-list > pkglist.nox
cat pkglist.full | grep -v libreoffice | grep -v texlive | sort > pkglist
cat pkglist.full | grep libreoffice | sort > pkglist.libreoffice
cat pkglist.full | grep texlive | sort > pkglist.texlive
