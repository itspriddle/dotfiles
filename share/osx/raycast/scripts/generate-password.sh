#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Generate Password
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🔒
# @raycast.packageName Generate Password

# Documentation:
# @raycast.description Generate a password
# @raycast.author Josh Priddle

bashword | tee >(pbcopy)

# Close Raycast window
echo "tell application \"System Events\" to key code 53" | osascript
