# Personal dot files configuration

## General

```sh
cd ~
git clone https://github.com/musashimm/dotfiles.git ~/.dotfiles
chmod 755 ~/.dotfiles/configure.sh && ~/.dotfiles/configure.sh
```

## Zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s ~/.dotfiles/zsh/plugins/musashi ~/.oh-my-zsh/custom/plugins/musashi
rm -rf ~/.oh-my-zsh/custom/themes
ln -sf ~/.dotfiles/zsh/themes ~/.oh-my-zsh/custom/themes
ln -s .dotfiles/zsh/.zshrc ~/.zshrc
```

### Zsh functions

```sh
musashi_uptime_short
musashi_tmux_color[color]
```
