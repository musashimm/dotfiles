# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# rbenv
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
# source ~/.rbenv/completions/rbenv.bash

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
  # Shell is non-interactive.  Be done now!
  return
fi


# Put your fun stuff here.
export EDITOR=/usr/bin/vi
alias g='gvim --remote-silent -geometry 160x60'
alias vi='g'

alias t='tmux -2'

alias ys='yard server --reload'

alias mms='be middleman server'
alias mmb='be middleman build'

alias be='bundle exec'
alias bi='bundle install'
alias buc='bundle check'
alias ber='be rspec'
alias beg='be guard'
alias bec='be rails c'
alias best='be rails s -e staging'
alias bep='be rails s -e production'
alias berk='be rake'

alias gst='git status'
alias gid='git add'
alias grm='git rm'
alias gdf='git diff'
alias gad='git add .;git status'
alias gitp='git push;git status'
alias gca='git_commit_all_with_no_quotas'
alias grm="git status |grep deleted|awk '{print \$3}'|xargs git rm"

function start_rails {
if [ -f ./script/server ]; then
  bundle exec script/server
else
  be rails s -b 127.0.0.1
fi
}
alias bes='start_rails'
function git_commit_all_with_no_quotas {
  git commit -a -m "$*"
  git status
}
alias glg='git lg'
function gitprompt {
  vcprompt --format "(%s:%b%m%a%u)"
}

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

ruby_version='$(rbenv version | sed -e "s/ (set.*$//")'

export PS1="$PURPLE\u@\h$WHITE:$BLUE\w$GREEN(${ruby_version})$YELLOW\$(gitprompt)$WHITE\$ "
