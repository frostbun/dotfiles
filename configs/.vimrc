set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
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

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
