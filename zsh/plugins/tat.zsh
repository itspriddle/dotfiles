if [[ ! -o interactive ]]; then
  return
fi

compctl -K _tat tat

_tat() {
  local word words completions
  read -cA words

  completions="$(
    if [[ "${words[-1]:0:1}" = "-" ]]; then
      echo "--list"
      echo "-L"
      echo "--help"
      echo "-h"
    fi
    tat -L 2> /dev/null
  )"

  reply=("${(ps:\n:)completions}")
}
