#ssh agent
if [ "x$SSH_CONNECTION" = "x" ]; then
  eval $(ssh-agent)
fi

#programs
export EDITOR=vim
export SHELL=zsh

#keep colors in less
export LESS="-R"

#path
export PATH=$HOME/bin:/sbin:/usr/sbin:$PATH

#cabal install darcs
export PATH=$PATH:$HOME/.cabal/bin
