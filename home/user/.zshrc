
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle :compinstall filename '/home/raphael/.zshrc'

autoload -Uz compinit
compinit
HISTCONTROL=erasedups
HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=5000
unsetopt beep
bindkey -v

#vi-like-ish Up and Down arrows
history-beginning-search-forward-and-vicmd() {
  zle vi-cmd-mode
  zle forward-char
  zle history-beginning-search-forward
}
zle -N history-beginning-search-forward-and-vicmd

history-beginning-search-backward-and-vicmd() {
  zle vi-cmd-mode
  zle forward-char
  zle history-beginning-search-backward
}
zle -N history-beginning-search-backward-and-vicmd

bindkey -M viins '\e[A' history-beginning-search-backward-and-vicmd
bindkey -M viins '^K' history-beginning-search-backward-and-vicmd
bindkey -M vicmd '\e[A' history-beginning-search-backward
bindkey -M vicmd '^K' history-beginning-search-backward
bindkey -M viins '\e[B' history-beginning-search-forward-and-vicmd
bindkey -M viins '^J' history-beginning-search-forward-and-vicmd
bindkey -M vicmd '\e[B' history-beginning-search-forward
bindkey -M vicmd '^J' history-beginning-search-forward

bindkey '\e[z' expand-or-complete-prefix

#Make 'rm *' safe
setopt RM_STAR_WAIT


# aliases
alias gps='ps -ly -C '

alias ..='cd ..'
alias ...='cd ../..'

alias ls='ls --color=auto'
alias l='ls -alhF'
alias ll='ls -lh'
alias l1='ls -1'
alias la='ls -a'
alias l1a='ls -1a'
alias lla='ls -lah'

if [ -x /usr/bin/pacman-color ]
then
  PACMANBIN="pacman-color"
else
  PACMANBIN="pacman"
fi

alias pacu='sudo $PACMANBIN -Syu'
alias pacs='sudo $PACMANBIN -Ss'
alias paci='sudo $PACMANBIN -Syu && sudo pacman -S'
alias pacr='sudo $PACMANBIN -R'
alias pacq='sudo $PACMANBIN -Qi'

export RLWRAP_EDITOR='vim +%L +"sil! call cursor(0, %C)"'

#functions
f() { find . -iname "*$1*" | grep -i --colour=auto "$1" }

md () { mkdir -p $1 && cd $1 }

kill9 () { kill -9 $(gps $1 | grep $1 | awk '{ print $3}') }

flag.io () {
  [[ -n $1 ]] || return
  curl -s -T $1 flag.io | grep -v "^#"
}


#automatic function to change title of terminal
chpwd () {
  [[ -t 1 ]] || return
  case $TERM in
    (st*|*xterm*|rxvt*) print -Pn "\e]2;%/\a"
      ;;
  esac
}
chpwd


#PS
export PS1="$(print '%{\e[1;32m%}%n %{\e[1;34m%}%~ \$ %{\e[0m%}')"
if [ "x$SSH_CONNECTION" != "x" ]; then
  export PS1="$(print '%{\e[1;31m%}%n@%M %{\e[1;32m%}%~ \$ %{\e[0m%}')"
fi
