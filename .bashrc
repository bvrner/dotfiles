#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias pacman='sudo pacman'
alias rm='rm -i'
alias la='ls -al'
alias yay='yay --noconfirm'
alias redshift='redshift -l -16.028721:-47.987101'
