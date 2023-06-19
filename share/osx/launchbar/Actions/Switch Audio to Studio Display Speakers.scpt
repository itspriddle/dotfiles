#!/usr/bin/env osascript

do shell script "/opt/homebrew/bin/SwitchAudioSource -i 53 -t output"
do shell script "/opt/homebrew/bin/SwitchAudioSource -i 63 -t input"
