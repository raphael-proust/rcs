#!/bin/sh

xbindkeys -f $HOME/.xbindkeysrc
setxkbmap -option compose:menu
setxkbmap -option compose:prsc
xmodmap $HOME/.xmodmap

source $HOME/.profile

wm_bin="$1"

wmname $(echo $wm_bin | sed -e "s/^\(\S\+\).*/\1/")

while true
do
  set-status-line-bnwr
  sleep 60
done &

set-bg-bnwr &

exec ${wm_bin}
