export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

_cakecomplete() {
  if [ -f Cakefile ]; then
    recent=`ls -t .cake_tasks~ Cakefile 2> /dev/null | head -n 1`

    if [[ $recent != '.cake_tasks~' ]]; then
      cake --silent --tasks | cut -d " " -f 2 > .cake_tasks~
    fi

    COMPREPLY=($(compgen -W "`cat .cake_tasks~`" -- ${COMP_WORDS[COMP_CWORD]}))
    return 0
  fi
}

complete -o default -o nospace -F _cakecomplete cake
