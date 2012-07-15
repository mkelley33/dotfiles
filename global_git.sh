#!/bin/bash

# TODO: make sure GIT_EMAIL are set to something before
# attempting to run this script.
if [ $GIT_EMAIL = '' ]; then
  echo "Please set a global e-mail address for git."
  echo "Type something like: export GIT_EMAIL='test@example.com'"
  echo "Next re-run this script."
else
  git config --global user.email $GIT_EMAIL
fi
