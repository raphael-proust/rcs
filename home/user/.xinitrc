#!/bin/sh
xset b off
xkbcomp $HOME/.xkb.hjkl $DISPLAY
sxhkd -r /tmp/sxhkd.log -c $HOME/.sxhkdrc &
xrdb $HOME/.Xresources
wmname $(printf %s ${1} | sed -e "s/^\(\S\+\).*/\1/")
xsetroot -solid "#ffffec"
xsetroot -cursor_name left_ptr
while true
do
	xsetroot -name "$(laptop-status)"
	sleep 60
done &

st &

exec $* 2> /tmp/xinitrc-exec.log
