#
# ~/.bashrc
#

export VISUAL=nvim;
export EDITOR=nvim;

export SDL_VIDEODRIVER=wayland;
export QT_QPA_PLATFORM=wayland;

export RANGER_LOAD_DEFAULT_RC=false;
export XDG_CURRENT_DESKTOP=Hyprland;


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

source ~/.local/share/blesh/ble.sh

#[[ $- == *i* ]] && source ~/usr/share/belsh/ble.sh
#[[ $- == *i* ]] && source ~/.local/share/belsh/ble.sh

#[[ -f ~/.bash-preecex.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"
