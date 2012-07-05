#ssh agent
eval $(ssh-agent)

#programs
export EDITOR=vim
export SHELL=zsh
export LESS="-R"

#path
export PATH=$HOME/bin:/sbin:/usr/sbin:$PATH

#cabal install darcs
export PATH=$PATH:$HOME/.cabal/bin
