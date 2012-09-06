!/bin/sh

#bell off
xset b off

#fixing the keyboard
xkbcomp .xkb $DISPLAY
xbindkeys -f $HOME/.xbindkeysrc

#setting X resources
xrdb ~/.Xresources

#getting window manager ready
wm_bin="$1"

wmname $(echo $wm_bin | sed -e "s/^\(\S\+\).*/\1/")
while true
do
  set-status-line-bnwr
  sleep 60
done &

#setting the background
set-bg-bnwr &

#starting the window manager
exec ${wm_bin}
