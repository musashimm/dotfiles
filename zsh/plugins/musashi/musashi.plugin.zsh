function musashi_uptime_short() {
  uptime|cut -d "," -f 1|cut -f 4-5 -d " "
}

function musashi_tmux_color() {
  color=${1}
  if [[ $color ]]; then
    echo "Tmux color for: ${1}"
    printf "\x1b[38;5;${1}mcolour${1}\x1b[0m\n"
  else
    echo "Tmux all colors:"
    for i in {0..255}; do
      printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
    done
  fi
}

function musashi_ruby_version() {
  rbenv_prompt_info
  # echo "%{$fg_bold[magenta]%}($(rbenv_prompt_info))%{$reset_color%}"
}

# Determine if we are using a gemset.
function musashi_rvm_gemset() {
    if hash rvm 2>/dev/null; then
        GEMSET=`rvm gemset list | grep '=>' | cut -b4-`
        if [[ -n $GEMSET ]]; then
            echo "%{$fg[yellow]%}$GEMSET%{$reset_color%}|"
        fi
    fi
}

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function musashi_git_time_since_commit() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        # Only proceed if there is actually a commit.
        if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
            # Get the last commit.
            last_commit=`git log --pretty=format:'%at' -1 2> /dev/null`
            now=`date +%s`
            seconds_since_last_commit=$((now-last_commit))

            # Totals
            MINUTES=$((seconds_since_last_commit / 60))
            HOURS=$((seconds_since_last_commit/3600))

            # Sub-hours and sub-minutes
            DAYS=$((seconds_since_last_commit / 86400))
            SUB_HOURS=$((HOURS % 24))
            SUB_MINUTES=$((MINUTES % 60))

            if [[ -n $(git status -s 2> /dev/null) ]]; then
                if [ "$MINUTES" -gt 30 ]; then
                    COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG"
                elif [ "$MINUTES" -gt 10 ]; then
                    COLOR="$ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM"
                else
                    COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT"
                fi
            else
                COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
            fi

            if [ "$HOURS" -gt 24 ]; then
                echo "$COLOR$(musashi_rvm_gemset)${DAYS}d%{$reset_color%}|"
            elif [ "$MINUTES" -gt 60 ]; then
                echo "$COLOR$(musashi_rvm_gemset)${HOURS}h%{$reset_color%}|"
            else
                echo "$COLOR$(musashi_rvm_gemset)${MINUTES}m%{$reset_color%}|"
            fi
        else
            COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
            echo "($(musashi_rvm_gemset)$COLOR~|"
        fi
    fi
}

# Git customizations
function git_commit_all_with_no_quotas {
  git commit -a -m "$*"
  git status
}
alias gca='git_commit_all_with_no_quotas'
alias glg='git lg'
alias grm='git rm $(git ls-files --deleted)'
alias gdf='git diff --name-only'

# Ruby customizations
alias ruby-httpd='ruby -run -ehttpd . -p3000'
alias rdoc='rdoc -o doc/rdoc -f hanna lib/**/*.rb *.md --main README.md'

# Procodile customizations
alias prs='procodile start'
alias prk='procodile kill'
alias prst='procodile status'
alias prr='procodile restart'
