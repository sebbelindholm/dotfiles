#   /$$$$$$  /$$        /$$$$$$ 
#  /$$__  $$| $$       /$$__  $$
# | $$  \__/| $$      | $$  \__/
# |  $$$$$$ | $$      | $$ /$$$$
#  \____  $$| $$      | $$|_  $$
#  /$$  \ $$| $$      | $$  \ $$
# |  $$$$$$/| $$$$$$$$|  $$$$$$/
#  \______/ |________/ \______/ 

# Sebastian Lindholm Gustafsson bash config file.

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias config='/usr/bin/git --git-dir=/home/sebastian/.cfg/ --work-tree=/home/sebastian'

colorscript exec crunchbang
eval "$(starship init bash)"
