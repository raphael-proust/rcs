#ssh agent
if [ "x$SSH_CONNECTION" = "x" ]; then
  eval $(ssh-agent)
fi

export LANG=en_US.UTF-8
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim

export EDITOR=vim
export SHELL=zsh

export PATH=$HOME/bin:$PATH
export MANPATH=/usr/man:/usr/share/man:/usr/local/share/man

source .profile.usul
source .profile.cabal
source .profile.opam
source .profile.mosml
