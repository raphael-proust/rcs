#!/bin/sh
xset b off
xkbcomp .xkb $DISPLAY
xbindkeys -f $HOME/.xbindkeysrc
xrdb ~/.Xresources
wmname $(printf %s ${1} | sed -e "s/^\(\S\+\).*/\1/")

while true
do
  mplayer -vo png:prefix=$(date '+%Y-%m-%d-%H-%M-'):outdir=$HOME/.login-pic -frames 1 tv://
  sleep 3600
done &
bgs -x $HOME/images/bg/$(shuf -n1 $HOME/images/bg/bgs.txt) &
while true
do
  set-status-line-bnwr
  sleep 60
done &

dmenu -v >/dev/null

exec $*
