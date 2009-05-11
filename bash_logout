# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy


if [ "$SHLVL" = 1 ]; then
#    history -w ~/.bash_history_logs/$REMOTE_HOST.out
#    diff ~/.bash_history_logs/$REMOTE_HOST.tmp ~/.bash_history_logs/$REMOTE_HOST.out > ~/.bash_history_logs/$REMOTE_HOST-`date +%F_%H%M`.log
#    rm ~/.bash_history_logs/$REMOTE_HOST.tmp ~/.bash_history_logs/$REMOTE_HOST.out
#    if [ $(du ~/.bash_history_logs/$REMOTE_HOST-`date +%F_%H%M`.log | awk '{print $1}') == 0 ]; then
#        rm ~/.bash_history_logs/$REMOTE_HOST-`date +%F_%H%M`.log
#    fi
#    unset REMOTE_HOST
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
