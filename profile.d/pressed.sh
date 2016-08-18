# Pressed Helix apps, disable progress bar rspec formatter
export DISABLE_HELIX_CORE_RSPEC_FORMATTER=1

alias helix-console="~/work/helix/bin/rails console"
alias helix-core-console="~/work/helix_core/script/console"
alias backstage-console="~/work/backstage/bin/rails console"
alias eventhorizon-console="~/work/event_horizon/bin/rails console"

alias hcc=helix-core-console

# Setup pressed
command -v pressed > /dev/null && eval "$(pressed init -)"
