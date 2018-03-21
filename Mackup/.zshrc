# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
autoload -Uz is-at-least
if ! is-at-least 5.2; then
  export ZSH=/home/mark/.oh-my-zsh
  ZSH_THEME="refined"
  ENABLE_CORRECTION="true"
  COMPLETION_WAITING_DOTS="true"
  plugins=(
    git
    bundler
    dotenv
    rake
    ruby
  )
  source $ZSH/oh-my-zsh.sh
else
  ZSH_THEME="powerline"
  export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
  # Start zim
  [[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh#
  # User configuration sourced by interactive shells
  source ${ZDOTDIR:-${HOME}}/.zlogin
  # Change default zim location
  # export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
  # Start zim
  [[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh#
  # prompt -s powerline
fi
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
#
# User configuration sourced by interactive shells
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
alias gl="git log --pretty=format:'%C(green)%ad %C(auto)%h %C(auto)[%an]%C(auto)%d %s' --date=format:'%Y/%m/%d %H:%M'"
alias gs="git status --column"
export RAILS_ENV=development_mark
alias dbm="RAILS_ENV=development_mark bundle exec rake db:migrate"
alias cg="cd ~/web;source ~/.zshrc;"
alias bi="rvmsudo bundle install"
alias tag-gen="cg;ctags -R --languages=ruby --exclude=.git --exclude=log . ;cd -"
alias snap-gen="ssh deploy@lethe 'web/tools/snapshot_db_zfs -f mark'"
alias xclip="xclip -selection c"
export REPO_PATH=~/web     # change fo-r your layout
alias git_clean_local_branches='git branch --merged | egrep -v "(^\*|master)" | xargs --no-run-if-empty git branch -d'
alias git_clean_remote_branches='git branch -r --merged | egrep -v "(^\*|master)" | xargs --no-run-if-empty -n 1 git push --delete'
alias cat='pygmentize -g'
if [ -f $REPO_PATH/script/panjiva_zshrc ]; then
  source $REPO_PATH/script/panjiva_zshrc
  setup_git_hooks
fi
export TERM=xterm-256color
export rvmsudo_secure_path=1
export VISUAL=vim
export EDITOR=""$VISUAL""
export PATH=$HOME/.local/bin:$PATH
if [ -f $HOME/.rvm/scripts/rvm ]; then
  source $HOME/.rvm/scripts/rvm
elif [ -f /usr/local/rvm/scripts/rvm ]; then
  source /usr/local/rvm/scripts/rvm
fi

rvm use 2.3.0
rvm_slience_mismatched_path=1
xmodmap -e "clear lock" #disable caps lock switch
xmodmap -e "keysym Caps_Lock = Escape" #set caps_lock as escape
