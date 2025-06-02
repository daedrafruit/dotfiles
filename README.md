using stow

nvim config in dedicated repository

Add to repository with:
$ mkdir -p ~/dotfiles/<config_name>/.config
$ mv ~/.config/<config_name> ~/dotfiles/<config_name>/.config

Install from repository(or just copy):
$ cd ~/dotfiles
$ stow <config_name>

Keyd requires sudo:
$ cd ~/dotfiles
$ sudo stow --target=/ keyd 
