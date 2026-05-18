if status is-interactive

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

end
