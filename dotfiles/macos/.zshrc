# -------------------------
# OhmyZsh Official Template
# ------------------------

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
 plugins=(git tmux)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/Repos/Github/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ----------
# iTerm2
# ----------

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Android adb
export PATH=/Users/$USER/Library/Android/sdk/platform-tools:$PATH

# Flutter
# export PATH="$PATH:/Users/$USER/Repos/Github/flutter/bin"

# 
# My Alias
#

alias ohmyzsh="vim ~/.oh-my-zsh"
alias zshconfig="vim ~/.zshrc"
alias l='ls -CF'
alias ll='ls -haltF'
alias la='ls -A'
alias vh='vim /etc/hosts'
alias vrc='vim ~/.zshrc'
alias src='source ~/.zshrc'
alias nrd="npm run dev"
alias tf="terraform"

#
# Tmux
#

# will  overwrite oh-my-zsh/plugins/tmux/tmux.plugins.zsh
alias ta='tmux attach'
alias tt='tmux attach -t '

# GIT
alias gl="git log"
alias gv="git remote -v"
alias gs="git status"
alias gb="git branch -a -vv"
alias gpr="git pull --rebase"
alias gca="git commit --amend"
alias gw="git switch"
alias gpl="git pull"
alias gpa="git remote | xargs -L1 git push"

# Kubectl
alias k='kubectl'
alias kg='kubectl get'
alias kc='kubectl create'
alias kd='kubectl delete'
alias kno='kubectl get nodes -o wide'
alias kn='kubectl get nodes'
alias kf='kubectl config'
alias kfv='kubectl config view'
alias kfc='kubectl config current-context'
alias kds='kubectl describe'
alias kx='kubectl explain'
alias kpo='kubectl get pods -o wide'
alias kp='kubectl get pods'
alias ky='kubectl get deployment'
alias kyo='kubectl get deployment -o wide'
alias ka='kubectl get all'
alias kao='kubectl get all -o wide'

# My Git Pusher
alias pusher="$HOME/Repos/Codebase/pusher/app.zsh"

# MAMP MySQL
alias mamp-mysql="/Applications/MAMP/Library/bin/mysql -u root -p"
alias mamp-php="/Applications/MAMP/bin/php/php7.1.33/bin/php"

# Cow
ANSIBLE_COW_SELECTION=random

# Browsers
#alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
#alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
#alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"

# Brew links
export PATH=/usr/local/sbin:$PATH

# yt folder
alias yt="cd '/Users/$USER/Google Drive/My Drive/yt'"


# use nvm, generated by ansible
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

alias gr="/Users/$USER/.nvm/versions/node/$(nvm_version)/bin/gr"

# Python package
export PATH=$PATH:/Users/$USER/Library/Python/3.9/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
 export SDKMAN_DIR="/Users/$USER/.sdkman"
 [[ -s "/Users/USER/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/$USER/.sdkman/bin/sdkman-init.sh"

