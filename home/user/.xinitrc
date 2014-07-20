#!/bin/sh
xset b off
xkbcomp .xkb.hjkl $DISPLAY
xcape -e 'Control_L=Multi_key'
xbindkeys -f $HOME/.xbindkeysrc
xrdb ~/.Xresources
wmname $(printf %s ${1} | sed -e "s/^\(\S\+\).*/\1/")
bgs -x $HOME/images/bg/$(shuf -n1 $HOME/images/bg/bgs.txt) &
mplayer -vo png:outdir=/tmp -frames 1 tv:// &
task -n status reset-status-line-bnwr 60

NAMESPACE=$(mktemp -d /tmp/plmb.XXXXXX)
plumber
plumber=$(pgrep -n plumber)
cat $HOME/plumbing | 9p write plumb/rules

st &
st &

task -n mugs mugshot $HOME/.login-pic 600

exec $*

kill $plumber
