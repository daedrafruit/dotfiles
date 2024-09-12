wip/experimental

mostly catppuccin

using stow to manage

nvim config in dedicated repository

Add to repository with:
$ mkdir -p ~/dotfiles/<config_name>/.config
$ mv ~/.config/<config_name> ~/dotfiles/<config_name>/.config

Install from repository(or just copy):
$ cd ~/dotfiles
$ stow <config_name>
