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
      xsetroot -name "$(status-line-bnwr)"
      sleep 30
    done &
    ;;
esac

set-bg-bnwr &

exec ${wm_bin}
