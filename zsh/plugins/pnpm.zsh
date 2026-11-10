if [ -d "$HOME/Library/pnpm" ]; then
  export PNPM_HOME="$HOME/Library/pnpm"

  case ":$PATH:" in
    ":$PNPM_HOME/bin:"*) ;;
    *) export PATH="$PNPM_HOME/bin:$PATH" ;;
  esac
fi
