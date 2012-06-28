#!/bin/sh

pacman -Qeq | sort > /tmp/pacman-Qeq-list
pacman -Qmq | sort > /tmp/pacman-Qmq-list
comm -23 /tmp/pacman-Qeq-list /tmp/pacman-Qmq-list > pkglist
comm -12 /tmp/pacman-Qeq-list /tmp/pacman-Qmq-list > aur-pkglist
