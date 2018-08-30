syntax on

set clipboard+=unnamed
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set number

set paste
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
call plug#end()

set clipboard=unnamed,autoselect
set backspace=indent,eol,start

