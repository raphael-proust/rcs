# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle :compinstall filename '/home/raphael/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=5000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install


setopt RM_STAR_WAIT
export RPS1="$(print '[ %{\e[1;36m%}%T%{\e[0m%} ]')"


# aliases
alias gps='ps -ly -C '

alias ..='cd ..'
alias ...='cd ../..'

alias ls='ls --color=auto'
alias l='ls -alhF'
alias ld="ls -l | grep ^d"
alias ll='ls -lh'
alias la='ls -lah'

alias o='less'


f() { find . -iname "*$1*" }

md () { mkdir -p $1 && cd $1 }

kill9 () { kill -9 $(gps $1 | grep $1 | awk '{ print $3}') }

export PS1="$(print '%{\e[1;32m%}%n %{\e[1;34m%}%~ \$ %{\e[0m%}')"
if [ "x$SSH_CONNECTION" != "x" ]; then
  export PS1="$(print '%{\e[1;31m%}%n@%M %{\e[1;32m%}%~ \$ %{\e[0m%}')"
fi
export EDITOR=vim
export SHELL=zsh

export PATH=$HOME/bin:/sbin:/usr/sbin:$PATH
