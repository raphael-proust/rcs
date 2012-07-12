#!/bin/sh

pacman -Qeq | sort > /tmp/pacman-Qeq-list
pacman -Qmq | sort > /tmp/pacman-Qmq-list
comm -23 /tmp/pacman-Qeq-list /tmp/pacman-Qmq-list > pkglist.full
comm -12 /tmp/pacman-Qeq-list /tmp/pacman-Qmq-list > aur-pkglist
cat pkglist.full | grep -v libreoffice | grep -v texlive > pkglist
cat pkglist.full | grep libreoffice > pkglist.libreoffice
cat pkglist.full | grep texlive > pkglist.texlive
