#!/bin/sh
xset b off
xkbcomp .xkb $DISPLAY
xbindkeys -f $HOME/.xbindkeysrc

xrdb ~/.Xresources

wmname $(printf %s ${1} | sed -e "s/^\(\S\+\).*/\1/")
set-bg-bnwr &
while true
do
  set-status-line-bnwr
  sleep 60
done &

exec ${1}
