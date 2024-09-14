#
# ~/.bashrc
#

# If not running interactively, don't do anything

export VISUAL=nvim;
export EDITOR=nvim;
#export GTK_THEME=Tokyonight-Dark

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
