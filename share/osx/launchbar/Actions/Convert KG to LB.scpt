#!/usr/bin/env osascript

on handle_string(kg)
  set lb to kg * 2.20
  open location "x-launchbar:large-type?string=" & lb
end handle_string
