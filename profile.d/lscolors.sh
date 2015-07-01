if [ "${OSTYPE:0:6}" = "darwin" ]; then
  # "Ex": bold blue, directory
  # "Gx": bold cyan, symlink
  # "Fx": bold magenta, socket
  # "dx": brown, pipe
  # "Cx": bold green, executable
  # "Dx": bold brown, block special
  # "Dx": bold brown, character special
  # "Bx": bold red, setuid executable
  # "Bx": bold red, setgid executable
  # "Ex": bold blue, dir writable to others with sticky bit
  # "Ex": bold blue, dir writable to others no sticky
  export LSCOLORS=ExGxFxdxCxDxDxBxBxExEx
elif [ "${OSTYPE:0:5}" = "linux" ]; then
  export LS_COLORS="di=1;34;27:ln=1;36;27:so=1;35;27:pi=33;27:ex=1;32;27:bd=1;33;27:cd=1;33;27:su=1;31;27:sg=1;31;27:tw=1;34;27:ow=1;34;27:"
fi
