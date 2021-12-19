#!/usr/bin/env bash

# Based on https://gist.github.com/JuggoPop/10706934

if type __git_complete &> /dev/null; then
  # Allow aliases to use completion
  __git_complete gb  _git_branch
  __git_complete gbd _git_branch
  __git_complete gco _git_checkout
  __git_complete gd  _git_diff
  __git_complete gdc _git_diff
fi
