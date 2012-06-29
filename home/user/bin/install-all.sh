#!/bin/sh

INSTALLLIST='acpi dvtm-w-status govern rfswitch set_bg status-line switch-monitor toggle-ext-monitor toggletouchpad togglevga vpaste wifi wifi.usage xorg'

for i in $INSTALLLIST
do
  ln -i -s $PWD/$i $HOME/bin/
done
