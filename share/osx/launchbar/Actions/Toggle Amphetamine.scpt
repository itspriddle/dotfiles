#!/usr/bin/env osascript

tell application id "com.if.Amphetamine"
  set current_status to session time remaining

  if current_status is equal to -3 then
    start new session
  else if current_status is greater than or equal to 0 then
    end session
  end if
end tell
