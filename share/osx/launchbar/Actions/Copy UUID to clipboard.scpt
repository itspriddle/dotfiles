#!/usr/bin/env osascript

-- Copy a UUID to the clipboard

set the clipboard to do shell script "uuidgen | tr -d '\n'"
