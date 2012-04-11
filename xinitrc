xbindkeys -f $HOME/.xbindkeysrc
setxkbmap -option compose:menu
xmodmap $HOME/.xmodmap
exec ck-launch-session wmii
