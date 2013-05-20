# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
export EDITOR=/usr/bin/vi
export PATH=$PATH:$HOME/bin
alias g='gvim --remote-silent -geometry 160x60'
alias vi='gvim --remote-silent -geometry 160x60'

WHITE="\[\033[00m\]"
BLACK="\[\033[01;30m\]"
RED="\[\033[0;31m\]"
LIGHT_RED="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
LIGHT_GRAY="\[\033[0;37m\]"

function gitprompt {
	vcprompt --format "(%s:%b%m%a%u)"
}
export PS1="$PURPLE\u@\h$WHITE:$BLUE\w$YELLOW\$(gitprompt)$WHITE\$ "
