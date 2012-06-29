#!/bin/sh

INSTALLLIST='acpi dvtm-w-status govern rfswitch set_bg status-line switch-monitor toggle-ext-monitor toggle-hdmi toggle-touchpad toggle-vga toggle-video-output vpaste wifi wifi.usage xorg'

for i in $INSTALLLIST
do
  ln -f -s $PWD/$i $HOME/bin/
done
