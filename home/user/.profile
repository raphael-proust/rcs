#ssh agent
if [ "x$SSH_CONNECTION" = "x" ]; then
  eval $(ssh-agent)
fi

export LANG=en_US.UTF-8

export EDITOR=nvim
export SHELL=/usr/bin/zsh
export OPAMCOLOR=never

export PATH=$HOME/bin:$PATH

source .profile.usul
