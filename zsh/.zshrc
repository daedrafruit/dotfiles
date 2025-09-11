# p10k init
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zinit init
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"


###########
# plugins #
###########

# p10k (theme)
zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-syntax-highlighting

zinit light zsh-users/zsh-autosuggestions
zsh_autosuggest_highlight_style="fg=#585b70"

zinit light zsh-users/zsh-history-substring-search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
history_substring_search_highlight_found="fg=green,bold"

# oh-my-zsh plugins
zinit snippet OMZP::command-not-found
zinit snippet OMZP::git
zinit snippet OMZP::z
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::colorize


##########
# config #
##########
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
# navigate paths without cd
setopt autocd

# expand abbreviated paths completion (e.g. /h/d -> /home/daedr)
autoload -Uz compinit
compinit

# history
HISTSIZE=50000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt extended_history       
setopt hist_expire_dups_first 
setopt hist_ignore_dups       
setopt hist_ignore_space      
setopt hist_verify

# shell integrations
eval "$(atuin init zsh --disable-up-arrow)"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# env
export nnn_plug='p:preview-tui'
export nnn_trash='trash'
#automatic options for nnn

export nnn_plug='p:preview-tui'
export nnn_trash='trash'

# aliases

alias rm="rm -i"
#automatic options for nnn
alias nnn="nnn -a -u -u -p p"

alias beet='~/Music/Tools/Beets/venv/bin/beet'
alias beet-auto='find ~/Music/Downloads/ -type f -name "*.flac" -exec bash -c ~/Music/Tools/prog-to-baseline-jpeg.sh "$0" {} \; ; beet -d ~/Music/Library import --move ~/Music/Downloads && mv ~/Music/Downloads/* ~/Music/Tools/Backups/artifacts/'
alias eyed3='~/Music/Tools/eyed3/venv/bin/eyed3'
alias tidal-dl-ng='~/Music/Tools/tidal-dl-ng/venv/bin/tidal-dl-ng'
#alias rip='~/Music/Tools/streamrip/venv/bin/rip'

alias elastic-m3u='~/Music/Tools/elastic-m3u/venv/bin/python ~/Music/Tools/elastic-m3u/elastic-m3u.py'
alias tidal-dl='~/Music/Tools/tidal-dl/venv/bin/tidal-dl'

alias sysu="sudo pacman -Syu && yay && yay --devel --answerclean ALL && hyprpm update"
alias fsysu=" sudo pacman -Syu --noconfirm && yay --noconfirm && yay --devel --answerclean ALL --noconfirm && hyprpm update"
alias sysclean="sudo pacman -Rns $(pacman -Qdtq) ; yay -Sc"
alias upkglist="pacman -Qe > ~/dotfiles/pkglist.txt"
#
# ensure gtk theme doesnt effect waybar appearance
alias waybar="GTK_THEME=Adwaita waybar"
alias proton9="
STEAM_COMPAT_DATA_PATH=~/.local/share/Steam/steamapps/compatdata \
STEAM_COMPAT_CLIENT_INSTALL_PATH=~/.local/share/Steam \
~/.local/share/Steam/steamapps/common/Proton\ 9.0\ \(Beta\)/proton run"

