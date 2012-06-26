#ssh agent
eval $(ssh-agent)

#exports
export EDITOR=vim
export SHELL=zsh
export LESS="-R"

export PATH=$HOME/bin:/sbin:/usr/sbin:$PATH

#gem install cheat
export PATH=$PATH:$HOME/.gem/ruby/1.9.1/bin

#cabal install darcs
export PATH=$PATH:$HOME/.cabal/bin
