
for r in vimrc gvimrc pentadactylrc teledactylrc tmux.conf screenrc nethackrc gitconfig
  do
    ln -s $PWD/$r $HOME/.$r
  done

