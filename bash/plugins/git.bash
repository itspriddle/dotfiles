__define_git_completion () {
eval "
  _git_$2_shortcut () {
    COMP_LINE=\"git $2 \${COMP_LINE/$1}\"
    let COMP_POINT+=$((4+${#2}-${#1}))
    COMP_WORDS=(git $2 \"\${COMP_WORDS[@]:1}\")
    let COMP_CWORD+=1

    local cur words cword prev
    _get_comp_words_by_ref -n =: cur words cword prev
    _git
  }
"
}

__git_shortcut () {
  local alias_name git_cmd
  alias_name="$1"; shift;
  git_cmd="$1"; shift

  type _git_${git_cmd}_shortcut &>/dev/null || __define_git_completion $alias_name $git_cmd
  alias $alias_name="git $git_cmd $@"
  complete -o default -o nospace -F _git_${git_cmd}_shortcut $alias_name
}

__git_shortcut ga add
__git_shortcut gb branch
__git_shortcut gbd branch -d
__git_shortcut gc commit
__git_shortcut gco checkout
__git_shortcut gd diff
__git_shortcut gdc diff --cached

alias gco.='git checkout -- .'
alias gcomp-='git checkout master; git pull; git checkout -'
alias gcomp='git checkout master; git pull'
alias grm="git status --porcelain | awk '\$1 == \"D\" {print \$2}' | xargs git --git-dir=\$(git rev-parse --git-dir) rm --ignore-unmatch"
alias gs='git status -sb'
