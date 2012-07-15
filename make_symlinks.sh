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

dotfiles=(".bashrc" ".profile" ".zshrc")

for dotfile in "${dotfiles[@]}"
do
  if [ -f ${dotfile} ]; then
    dotfile_old="${dotfile}.`date +%m%d%y-%H-%M-%S`"
    echo "\nFile: ${dotfile} already exists!"
    echo "Renaming to ${dotfile_old}"
    mv $dotfile $dotfile_old
    echo "Creating ${dotfile} symlink"
    ln -s $DOTFILES_PATH/$dotfile
  elif [ -L ${dotfile} ]; then
    echo "Symlink ${dotfile} already exists!\n"
    echo "Symlink ${dotfile} not created!\n"
  fi
done
echo "\n"
