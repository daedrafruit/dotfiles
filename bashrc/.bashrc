#
# ~/.bashrc
#

# If not running interactively, don't do anything

export VISUAL=nvim;
export EDITOR=nvim;

export SDL_VIDEODRIVER=wayland;
export QT_QPA_PLATFORM=wayland;

export TERM=xterm-256color
export GTK_THEME=catppuccin-mocha
export QT_QPA_PLATFORMTHEME=qt6ct

#matlab
#export QT_QPA_PLATFORM=xcb;

#ranger
export RANGER_LOAD_DEFAULT_RC=false;

export XDG_CURRENT_DESKTOP=Hyprland

export NNN_PLUG='p:preview-tui'
export NNN_TRASH='trash'
#automatic options for nnn
alias nnn="nnn -a -U -u -P p"

alias sysu="sudo pacman -Syu && yay && yay --devel --answerclean ALL"
alias fsysu=" sudo pacman -Syu --noconfirm && yay --noconfirm && yay --devel --answerclean ALL --noconfirm"
alias sysclean="sudo pacman -Rns $(pacman -Qdtq) && yay -Sc"
alias upkglist="pacman -Qe > ~/dotfiles/pkglist.txt"

# ensure gtk theme doesnt effect waybar appearance
alias waybar="GTK_THEME=Adwaita waybar"
alias proton9="
STEAM_COMPAT_DATA_PATH=~/.local/share/Steam/steamapps/compatdata \
STEAM_COMPAT_CLIENT_INSTALL_PATH=~/.local/share/Steam \
~/.local/share/Steam/steamapps/common/Proton\ 9.0\ \(Beta\)/proton run"

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


