#!/bin/sh
xset b off
xkbcomp .xkb.hjkl $DISPLAY
xcape -e 'Control_L=Multi_key'
xbindkeys -f $HOME/.xbindkeysrc
xrdb ~/.Xresources
wmname $(printf %s ${1} | sed -e "s/^\(\S\+\).*/\1/")
bgs -x $HOME/images/bg/$(shuf -n1 $HOME/images/bg/bgs.txt) &
while true
do
	set-status-line-bnwr "$(status-line-bnwr)"
	dmenu -v >/dev/null
	sleep 60
done &
mplayer -vo png:outdir=/tmp -frames 1 tv:// &
while true
do
	sleep 1
	mplayer -vo png:prefix=$(date '+%Y-%m-%d-%H-%M-cam'):outdir=$HOME/.login-pic -frames 1 tv://
	sleep 599
done &

NAMESPACE=$(mktemp -d /tmp/plmb.XXXXXX)
plumber
plumber=$(pgrep -n plumber)
cat $HOME/plumbing | 9p write plumb/rules

st &
st &

exec $*

kill $plumber
