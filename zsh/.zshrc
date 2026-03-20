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

# vi mode
# fix home/end keys 
function zvm_after_init() {
  bindkey -M viins '^[[1~' beginning-of-line
  bindkey -M vicmd '^[[1~' beginning-of-line

  bindkey -M viins '^[[4~' end-of-line
  bindkey -M vicmd '^[[4~' end-of-line

  bindkey -M viins '^[[3~' delete-char
  bindkey -M vicmd '^[[3~' delete-char
}

zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode
# from https://github.com/jeffreytse/zsh-vi-mode/pull/179/files

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
# zsh-vi-mode atuin compatibility
. "$HOME/.atuin/bin/env" &> /dev/null
if command -v atuin &> /dev/null; then
    function my_init() {
        eval "$(atuin init zsh --disable-up-arrow)"
    }
    zvm_after_init_commands+=(my_init)
fi
#eval "$(atuin init zsh --disable-up-arrow)"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# aliases

alias sysclean="sudo pacman -Rns $(pacman -Qdtq) ; yay -Sc"

alias beet='~/Music/Tools/Beets/venv/bin/beet'
alias beet-auto='find ~/Music/Downloads/ -type f -name "*.flac" -exec bash -c ~/Music/Tools/prog-to-baseline-jpeg.sh "$0" {} \; ; beet -d ~/Music/Library import --move ~/Music/Downloads && mv ~/Music/Downloads/* ~/Music/Tools/Backups/artifacts/'

alias elastic-m3u='~/Music/Tools/elastic-m3u/venv/bin/python ~/Music/Tools/elastic-m3u/elastic-m3u.py'
