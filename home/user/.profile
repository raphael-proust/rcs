#ssh agent
if [ "x$SSH_CONNECTION" = "x" ]; then
  eval $(ssh-agent)
fi

export LANG=en_GB.UTF-8

export EDITOR=nvim
export SHELL=zsh
export OPAMCOLOR=never

export PATH=$HOME/bin:$PATH
export MANPATH=/usr/man:/usr/share/man:/usr/local/share/man

source .profile.usul
#source .profile.sbase
source .profile.cabal
source .profile.opam
source .profile.mosml
