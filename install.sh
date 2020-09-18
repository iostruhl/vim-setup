#!/bin/bash

set -e

if [ -d "${HOME}/.vim/autoload" ] || [ -d "${HOME}/.vim/bundle" ]; then
    echo "Vim install already detected."
    echo "Run rm -rf ~/.vim/* to clean up first."
    exit 1
fi

echo "Creating ~/.vim directories..."
mkdir -p ~/.vim/autoload ~/.vim/bundle

echo "Installing pathogen..."
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Downloading vimrc..."
curl -LSso ~/.vimrc https://raw.githubusercontent.com/iostruhl/vim-setup/master/.vimrc

echo "Cloning packages..."
git clone https://github.com/godlygeek/tabular.git ~/.vim/bundle/tabular
git clone https://github.com/vim-airline/vim-airline.git ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes.git ~/.vim/bundle/vim-airline-themes
git clone https://github.com/ntpeters/vim-better-whitespace.git ~/.vim/bundle/vim-better-whitespace
git clone https://github.com/bfrg/vim-cpp-modern.git ~/.vim/bundle/vim-cpp-modern
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/rhysd/vim-clang-format.git ~/.vim/bundle/vim-clang-format
git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe

echo "Running YouCompleteMe install with CXX support only..."
git -C ~/.vim/bundle/YouCompleteMe submodule update --init --recursive
python3 ~/.vim/bundle/YouCompleteMe/install.py --clangd-completer

echo "Done."

