# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

##################
# zsh extentions #
##################
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="alanpeabody"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#585b70"

plugins=(
	git
	#fzf
	z
	colored-man-pages

	# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	zsh-autosuggestions
	# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	zsh-syntax-highlighting
	# git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
	zsh-history-substring-search
)
source $ZSH/oh-my-zsh.sh

# history substring search bindings
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=green,bold"


##########
# config #
##########
export NNN_PLUG='p:preview-tui'
export NNN_TRASH='trash'
#automatic options for nnn

export NNN_PLUG='p:preview-tui'
export NNN_TRASH='trash'

#automatic options for nnn
alias nnn="nnn -a -U -u -P p"

alias beet='~/Music/Tools/Beets/venv/bin/beet'
alias beet-auto='find ~/Music/Downloads/ -type f -name "*.flac" -exec bash -c ~/Music/Tools/prog-to-baseline-jpeg.sh "$0" {} \; ; beet -d ~/Music/Library import --move ~/Music/Downloads && mv ~/Music/Downloads/* ~/Music/Tools/Backups/Artifacts/'
alias eyed3='~/Music/Tools/eyed3/venv/bin/eyeD3'
alias tidal-dl-ng='~/Music/Tools/tidal-dl-ng/venv/bin/tidal-dl-ng'
#alias rip='~/Music/Tools/streamrip/venv/bin/rip'

alias elastic-m3u='~/Music/Tools/elastic-m3u/venv/bin/python ~/Music/Tools/elastic-m3u/elastic-m3u.py'
alias tidal-dl='~/Music/Tools/Tidal-dl/venv/bin/tidal-dl'


alias sysu="sudo pacman -Syu && yay && yay --devel --answerclean ALL"
alias fsysu="sudo pacman -Syu --noconfirm && yay --noconfirm && yay --devel --answerclean ALL --noconfirm"
alias sysclean="sudo pacman -Qdtq | sudo pacman -Rns - ; yay -Sc"

. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh --disable-up-arrow)"
