#!/bin/sh

xbindkeys -f $HOME/.xbindkeysrc
setxkbmap -option compose:menu
setxkbmap -option compose:prsc
xmodmap $HOME/.xmodmap

source $HOME/.profile

wm_bin="$1"

case "$wm_bin" in
  dwm)
    while true
    do
      sleep 1
      xsetroot -name "$(status-line)"
      sleep 29
    done &
    ;;
esac

exec ${wm_bin}
