#!/bin/sh
xset b off
xkbcomp $HOME/.xkb.hjkl $DISPLAY
sxhkd -r /tmp/sxhkd.log -c $HOME/.sxhkdrc &
xrdb $HOME/.Xresources
wmname $(printf %s ${1} | sed -e "s/^\(\S\+\).*/\1/")
bgs -x $HOME/images/bg/$(shuf -n1 $HOME/images/bg/bgs.txt) &
mplayer -vo png:outdir=/tmp -frames 1 tv:// &
while true
do
	set-status-line-bnwr "$(status-line-bnwr)"
	sleep 60
done &
while true
do
	{
	mplayer -vo png:prefix="$(date '+%Y-%m-%d-%H-%M-mug')":outdir=$HOME/.login-pic -frames 1 tv://
	sleep 600
	}
done &

st &
st &

exec $*
