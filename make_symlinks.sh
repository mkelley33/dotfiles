#!/bin/bash

if [ -f ".bashrc" ]; then
  echo "File .bashrc already exists! Renaming to .bashrc.`date +%m-%d-%y`\n"
  mv ~/.bashrc ~/.bashrc.`date +%m-%d-%y`
  echo "Creating .bashrc symlink...\n"
  ln -s $DOTFILES_PATH/.bashrc
  echo "Modified files: \n"
  ll | grep 'bashrc'
  echo "\n"
elif [ -L ".bashrc" ]; then
  echo "Symlink .bashrc already exists!\n"
  echo "Symlink .bashrc not created!\n"
fi

