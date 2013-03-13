#!/bin/sh
xset b off
xkbcomp .xkb $DISPLAY
xbindkeys -f $HOME/.xbindkeysrc
xrdb ~/.Xresources
wmname $(printf %s ${1} | sed -e "s/^\(\S\+\).*/\1/")
bgs -x $HOME/images/bg/$(shuf -n1 $HOME/images/bg/bgs.txt) &
while true
do
	set-status-line-bnwr
	sleep 60
done &
while true
do
	sleep 1
	mplayer -vo png:prefix=$(date '+%Y-%m-%d-%H-%M-cam'):outdir=$HOME/.login-pic -frames 1 tv://
	import -window root $HOME/.login-pic/$(date '+%Y-%m-%d-%H-%M-screen').png
	sleep 599
done &

dmenu -v >/dev/null

exec $*
