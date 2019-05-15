" Envato Marketplace customizations
if exists("b:rails_root") && fnamemodify(b:rails_root, ":t") == "marketplace"
  " Use git grep for :Ag
  let g:simple_ag_command = "git --no-pager grep -n --untracked --no-color --column %s"
endif
