#ssh agent
if [ "x$SSH_CONNECTION" = "x" ]; then
  eval $(ssh-agent)
fi

export LANG=en_US.UTF-8

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
