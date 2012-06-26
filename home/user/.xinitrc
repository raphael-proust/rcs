#!/bin/sh

xbindkeys -f $HOME/.xbindkeysrc
setxkbmap -option compose:menu
setxkbmap -option compose:prsc
xmodmap $HOME/.xmodmap

source $HOME/.profile

wm_bin="$1"
exec ${wm_bin}
