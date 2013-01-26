#ssh agent
if [ "x$SSH_CONNECTION" = "x" ]; then
  eval $(ssh-agent)
fi

#env
export EDITOR=vim
export SHELL=zsh

#usul: use $USUL/ls, $USUL/cat, etc.
source .profile.usul

#path
export PATH=$HOME/bin:/sbin:/usr/sbin:$PATH
export MANPATH=/usr/man:/usr/share/man:/usr/local/share/man

#cabal
source .profile.cabal

#opam
source .profile.opam
