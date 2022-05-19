#!/usr/bin/env osascript

on handle_string(c)
  set f to c * (9/5) + 32
  open location "x-launchbar:large-type?string=" & f
end handle_string
