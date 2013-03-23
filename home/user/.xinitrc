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
	dmenu -v >/dev/null
	sleep 60
done &
mplayer -vo png:outdir=/tmp -frames 1 tv:// &
while true
do
	sleep 2
	mplayer -vo png:prefix=$(date '+%Y-%m-%d-%H-%M-cam'):outdir=$HOME/.login-pic -frames 1 tv://
	sleep 598
done &

exec $*
