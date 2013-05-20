# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[[ -f ~/.bashrc ]] && . ~/.bashrc
export http_proxy=http://localhost:5865
export TERM=xterm-256color
alias t='TERM=xterm-256color tmux'
