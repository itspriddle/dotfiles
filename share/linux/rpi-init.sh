#!/usr/bin/env bash

if ! type raspi-config &> /dev/null; then
  raspi-config nonint do_change_locale en_US.UTF-8
  raspi-config nonint do_change_timezone US/Eastern
else
  echo "Not a raspberry pi?" >&2
  exit 1
fi
