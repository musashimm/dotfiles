# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[[ -f ~/.bashrc ]] && . ~/.bashrc
export TERM=xterm-256color
alias t='TERM=xterm-256color tmux'
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$PATH:$HOME/bin:/usr/local/heroku/bin
eval "$(rbenv init -)"
