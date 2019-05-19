zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/raphael/.zshrc'

autoload -Uz compinit
compinit
HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=5000
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
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

bindkey -M vicmd '\e[z' expand-or-complete-prefix

zle_highlight=(default:bg=11)

setopt RM_STAR_WAIT

setopt MULTIOS
setopt NUMERIC_GLOB_SORT

#st
case $TERM in
	(st)
		function zle-line-init () { echoti smkx }
		function zle-line-finish () { echoti rmkx }
		zle -N zle-line-init
		zle -N zle-line-finish
		;;
esac

# aliases and functions
alias gps='ps -ly -C '
alias ls='ls -p'
alias l='ls -AlhF'
alias ll='ls -lh'
alias l1='ls -1'
alias la='ls -A'
alias l1a='ls -1A'
alias lla='ls -lAh'
alias day="date '+%Y-%m-%d'"
alias pacu='sudo pacman -Syu'
alias pacs='sudo pacman -Ss'
alias paci='sudo pacman -S'
alias pacr='sudo pacman -R'
alias pacq='sudo pacman -Qi'
alias pacl='sudo pacman -Ql'
alias paco='sudo pacman -Qo'
alias mp='mplayer -fs -af volume=4:1'
fcolor() { find . -iname "*$1*" | grep -i --colour=auto "$1" }
f() { find . -iname "*$1*" }
md () { mkdir -p $1 && cd $1 }
kill9 () { kill -9 $(gps $1 | grep $1 | awk '{ print $3}') }

#automatic function to change title of terminal
if [ "x$SSH_CONNECTION" != "x" ]
then
chpwd () {
	[[ -t 1 ]] || return
	case $TERM in
		(st*|*xterm*|rxvt*) print -Pn "\e]2;@%M - %/\a"
		;;
	esac
}
else
chpwd () {
	[[ -t 1 ]] || return
	case $TERM in
		(st*|*xterm*|rxvt*) print -Pn "\e]2;%/\a"
		;;
	esac
}
fi

#PS
export PS1="$ "
if [ "x$SSH_CONNECTION" != "x" ]
then
	if [ "x$USER" != "xbnwr" ]
	then
		export PS1="$(print '%{\e[1;31m%}%n%{\e[0m%}@%{\e[1;31m%}%M%{\e[0m%} \$ ')"
	else
		export PS1="$(print '%n@%{\e[1;31m%}%M%{\e[0m%} \$ ')"
	fi
else
	if [ "x$USER" != "xbnwr" ]
	then
		export PS1="$(print '%{\e[1;31m%}%n%{\e[0m%}@%M \$ ')"
	else
		export PS1="$(print '%{\e[0;48;5;11m%}$ %{\e[0m%}')"
	fi
fi

# OPAM configuration
. /home/bnwr/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
