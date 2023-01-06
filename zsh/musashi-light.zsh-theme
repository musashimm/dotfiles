# Prompt customizations
PROMPT='%{$fg_bold[black]%}[$(musashi_uptime_short)]%{$reset_color%} %{$fg[green]%}%3d%{$reset_color%} '
RPROMPT='%{$fg_bold[magenta]%}$(musashi_ruby_version)%{$reset_color%} '
RPROMPT+='$(musashi_git_time_since_commit)$(git_super_status)'

# Git prompt customizations
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[blue]%}%{?%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg_bold[blue]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[red]%}%{*%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg_bold[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg_bold[blue]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg_bold[black]%}%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[black]%}%{↑%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg_bold[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg_bold[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg_bold[blue]%}"
