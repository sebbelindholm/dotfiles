# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#Theme
ZSH_THEME=""

#Autostart colorscript
colorscript exec crunchbang

#Plugins
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

COMPLETION_WAITING_DOTS="true"
CASE_SENSITIVE="true"


#Alias
alias config="/usr/bin/git --git-dir=/home/sebastian/.cfg/ --work-tree=/home/sebastian"

#Star Ship
eval "$(starship init zsh)"

source $ZSH/oh-my-zsh.sh
