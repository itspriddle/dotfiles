#!/usr/bin/env bash

networksetup -listallhardwareports |
  grep -C1 "$(route get default | grep interface | awk '{print $2}')" |
  awk '/^Device/ { print $2 }'
