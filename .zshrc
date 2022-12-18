# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#   /$$$$$$  /$$        /$$$$$$ 
#  /$$__  $$| $$       /$$__  $$
# | $$  \__/| $$      | $$  \__/
# |  $$$$$$ | $$      | $$ /$$$$
#  \____  $$| $$      | $$|_  $$
#  /$$  \ $$| $$      | $$  \ $$
# |  $$$$$$/| $$$$$$$$|  $$$$$$/
#  \______/ |________/ \______/ 

# Sebastian Lindholm Gustafsson zsh config file.

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#Theme
ZSH_THEME=""

#Autostart colorscript
colorscript exec crunchbang

#Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

COMPLETION_WAITING_DOTS="true"
CASE_SENSITIVE="true"


#Alias
alias config="/usr/bin/git --git-dir=/home/sebastian/.cfg/ --work-tree=/home/sebastian"
alias ls='exa -al --color=always --group-directories-first'
alias cl='clear'


#Star Ship
eval "$(starship init zsh)"

source $ZSH/oh-my-zsh.sh
