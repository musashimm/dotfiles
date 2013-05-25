for file in gitconfig gitignore_global bashrc xinitrc bash_profile bash_logout tmux.conf Xdefaults
do
  echo "Making symlink to: $file"
  ln -sf ~/.dotfiles/$file ~/.$file
done
