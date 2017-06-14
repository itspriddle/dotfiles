# Pressed Helix apps, disable progress bar rspec formatter
export DISABLE_HELIX_CORE_RSPEC_FORMATTER=1

# Open a helix_core console
hcc() {
  cd ~/work/helix_core
  ./script/console
  cd -
}

# Setup pressed
command -v pressed > /dev/null && eval "$(pressed init -)"
