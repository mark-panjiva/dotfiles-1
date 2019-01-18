#
# User configuration sourced by interactive shells
#

# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

prompt eriner

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# append to the history file, don't overwrite it
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
# aliases
alias ff="find . -type f -name "
alias gl="git log --pretty=format:'%C(green)%ad %C(auto)%h %C(auto)[%an]%C(auto)%d %s %C(auto)[%an]' --date=format:'%Y/%m/%d %H:%M'"
alias gs="git status --column"
export RAILS_ENV=development_mark
alias dbm="RAILS_ENV=development_mark bundle exec rake db:migrate"
alias cg="cd ~/web"
alias cj="cd ~/jenkins"
alias bi="rvmsudo bundle install"
alias tag-gen="cg;ctags -R --languages=ruby --exclude=.git --exclude=log . ;cd -" 
alias snap-gen="ssh deploy@lethe 'web/tools/snapshot_db_zfs -f mark'"
alias xclip="xclip -selection c"
export REPO_PATH=~/workspaces/web     # change for your layout
alias git_clean_local_branches='git branch --merged | egrep -v "(^\*|master)" | xargs --no-run-if-empty git branch -d'
alias git_clean_remote_branches='git branch -r --merged | egrep -v "(^\*|master)" | xargs --no-run-if-empty -n 1 git push --delete'
if [ -f $REPO_PATH/script/panjiva_bashrc ]; then
  source $REPO_PATH/script/panjiva_bashrc
  setup_git_hooks
fi
export TERM=xterm-256color

export API_ACCESS_TOKEN="qUWznXxnHvZeizwZAhpU3Xp3IUtYkLuK5q47jgt8"
export RUBYOPT=-W0

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.local/bin:$HOME/.rvm/bin"
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[cursor]=bold
