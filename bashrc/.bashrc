#
# ~/.bashrc
#

# If not running interactively, don't do anything

export VISUAL=nvim;
export EDITOR=nvim;

export SDL_VIDEODRIVER=wayland;

#matlab
export QT_QPA_PLATFORM=xcb;

#ranger
export RANGER_LOAD_DEFAULT_RC=false;

export XDG_CURRENT_DESKTOP=Hyprland

# ensure gtk theme doesnt effect waybar appearance
alias waybar="GTK_THEME=Adwaita waybar"

#export GTK_THEME=Tokyonight-Dark

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# load blesh
[[ $- == *i* ]] && source /usr/share/blesh/ble.sh

# load atuin
# [[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"

