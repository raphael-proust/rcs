#ssh agent
if [ "x$SSH_CONNECTION" = "x" ]; then
  eval $(ssh-agent)
fi

sudo ip link set eth0 down

#env
export EDITOR=vim
export SHELL=zsh


#path
export PATH=$HOME/bin:/sbin:/usr/sbin:$PATH
export MANPATH=/usr/man:/usr/share/man:/usr/local/share/man

source .profile.usul
source .profile.cabal
source .profile.opam
source .profile.mosml
