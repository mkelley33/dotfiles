#!/bin/bash

# Don't allow this script to run in its own directory,
# because we don't want it to alter the dotfiles that
# were cloned.  Instead, this should be run from
# somewhere like HOME for example.
if [ $PWD = $DOTFILES_PATH ]; then
  echo 'This script cannot be run in the same directory as'
  echo 'the one specified by DOTFILES_PATH.\n\n'
  echo 'First cd into another directory, then'
  echo 'Run this script like so:\n\n source $DOTFILES_PATH/make_symlinks.sh\n'
  return
fi

dotfiles=(".bashrc" ".profile" ".zshrc" ".bash_login" ".gitconfig" ".git-completion.bash")

echo "\n"
for dotfile in "${dotfiles[@]}"
do
  if [ -L ${dotfile} ]; then
    echo "Not created: symlink ${dotfile} already exists!"
    continue
  elif [ -f ${dotfile} ]; then
    dotfile_old="${dotfile}.`date +%m%d%y-%H-%M-%S`"
    echo "File: ${dotfile} already exists!\n"
    echo "Renaming to ${dotfile_old}"
    mv $dotfile $dotfile_old
  fi
  echo "Creating ${dotfile} symlink\n"
  ln -s $DOTFILES_PATH/$dotfile
done
echo "\n"
