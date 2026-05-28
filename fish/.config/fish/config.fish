if status is-interactive
  # remove greeting
  set fish_greeting ""
  set -g tide_left_prompt_items context pwd git newline character
  set -g tide_right_prompt_items status cmd_duration jobs

  # plugins
  if not functions -q fisher
      curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
      fisher install jorgebucaran/fisher
      fisher install IlanCosman/tide@v6
      fisher install jethrokuan/z
      fisher install decors/fish-colored-man
  end

  # vi bindings
  fish_vi_key_bindings

  #atuin setup
  set -gx ATUIN_NOBIND "true"
  atuin init fish | source
  bind \cr _atuin_search
  bind -M insert \cr _atuin_search

  alias hydrus-mount "sudo veracrypt --fs-options='umask=022,dmask=022' --pim=0 --keyfiles= --protect-hidden=no --mount /zfs/mnt/media/hydrus/db /media/veracrypt1"
  alias hydrus-umount "sleep 3; and sudo veracrypt --unmount /zfs/mnt/media/hydrus/db; and sleep 1; and veracrypt --list"
  #alias hydrus-fumount "(sudo kill -9 (lsof +D /media/veracrypt1 2>/dev/null | awk 'NR>1 {print \$2}')); and hydrus-umount"
  alias hydrus-up "docker compose -f $HOME/docker/hydrus.yml up -d"
  alias hydrus-mup "hydrus-mount; and hydrus-up"
  alias hydrus-down "docker compose -f $HOME/docker/hydrus.yml down"
  alias hydrus-umount "sleep 3; and sudo veracrypt --unmount /zfs/mnt/media/hydrus/db; and sleep 1; and veracrypt --list"
  alias hydrus-mdown "hydrus-down; hydrus-umount"
  alias hydrus-mdown-bac "hydrus-down; and cd /media/veracrypt1/db; and duplicacy backup; and hydrus-umount"
  alias hydrus-bac "cd /media/veracrypt1/db; and duplicacy backup"
  alias hydrus-dbu "hydrus-down; and hydrus-bac; and hydrus-up"
  #alias hydrus-fdown "docker compose -f $HOME/docker/hydrus.yml down; hydrus-fumount"
  alias hydrus-status "echo 'Docker:'; docker ps -a | grep hydrus; echo '\nVeracrypt:'; veracrypt --list"

end
