# /etc/skel/.bash_profile
#
# This file is sourced by login shells

os=$(uname)
if [ "$os" == "Darwin" ]; then
  echo 'This is a login shell. Sourcing `.bash_profile` ...'
  if [[ $- == *i* ]]; then
    exec bash
  fi
fi