"" Download vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
"Git
    Plug 'tpope/vim-fugitive'
"Test Runners
    Plug 'vim-test/vim-test'
"Ruby & Rails
    Plug 'tpope/vim-rails'
"General
   Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
   Plug 'honza/vim-snippets'
   Plug 'tpope/vim-repeat'
   Plug 'tpope/vim-rsi'
   Plug 'tpope/vim-sensible'
   Plug 'tpope/vim-sleuth'
   Plug 'tpope/vim-surround'
   Plug 'jremmen/vim-ripgrep'
   Plug 'tpope/vim-unimpaired'
   Plug 'tpope/vim-endwise'
   Plug 'vim-scripts/AnsiEsc.vim'
   Plug 'kamykn/dark-theme.vim'
"Completion and ChatGPT
    Plug 'Exafunction/codeium.vim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'MunifTanjim/nui.nvim'
    Plug 'dpayne/CodeGPT.nvim'
    Plug 'williamboman/mason.nvim'
call plug#end()

syntax on
set path=*/**

lua require('init')

"colo allhallowseve
colo darktheme

" coc-vim plugins
autocmd! GUIEnter * set vb t_vb=
language en_US
"ChatGPT
let g:chat_gpt_model='gpt-4'
let g:chat_gpt_max_tokens=2000
let g:chat_gpt_session_mode=1

"Codeium
let g:codeium_disable_bindings = 1
