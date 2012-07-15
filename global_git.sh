#!/bin/bash

# TODO: make sure GIT_EMAIL are set to something before
# attempting to run this script.
echo "Updating global git config"
if [ $GIT_EMAIL = '' ]; then
  echo "Please set a global e-mail address for git."
  echo "Type something like: export GIT_EMAIL='test@example.com'"
  echo "Next re-run this script."
else
  echo "user.email was ${GIT_EMAIL}"
  git config --global user.email $GIT_EMAIL
  echo "user.email is now ${GIT_EMAIL}"
fi
