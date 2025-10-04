set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'valloric/youcompleteme'
Plugin 'ghifarit53/tokyonight-vim'

call vundle#end()

let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
let g:airline_theme = 'tokyonight'
let g:airline_powerline_fonts = 1

set termguicolors

colorscheme tokyonight

filetype plugin indent on

syntax on

set mouse=a

set number
set relativenumber

set cursorline

set shiftwidth=4
set tabstop=4
set expandtab

set scrolloff=10

set nowrap

set incsearch
set hlsearch
set ignorecase
set smartcase

set showcmd
set showmode

set wildmenu
set wildmode=list:longest
