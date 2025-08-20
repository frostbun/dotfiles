set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'valloric/youcompleteme'

call vundle#end()

filetype plugin indent on

syntax on

set mouse=a

set number
set relativenumber

set cursorline

set shiftwidth=4
set tabstop=4
set expandtab

set scrolloff=5

set nowrap

set incsearch
set hlsearch
set ignorecase
set smartcase

set showcmd
set showmode

set wildmenu
set wildmode=list:longest
