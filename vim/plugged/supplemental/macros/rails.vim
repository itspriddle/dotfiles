" Allow projects that depend on HelixCore to use its tags
if exists("b:rails_root")
  let s:gemfile = b:rails_root . "/Gemfile"

  if filereadable(s:gemfile) && match(readfile(s:gemfile), "helix_core")
    setlocal tags+=~/work/helix_core/.git/tags
  endif
endif
