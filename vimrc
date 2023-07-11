"" Download vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
"Completion and more
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Git
    Plug 'tpope/vim-fugitive'
"Test Runners
    Plug 'vim-test/vim-test'
"Ruby & Rails
    Plug 'tpope/vim-rails'
"General
   Plug 'honza/vim-snippets'
   Plug 'tpope/vim-repeat'
   Plug 'tpope/vim-rsi'
   Plug 'tpope/vim-sensible'
   Plug 'tpope/vim-sleuth'
   Plug 'tpope/vim-surround'
   Plug 'tpope/vim-unimpaired'
   Plug 'Exafunction/codeium.vim'
"Theme
    Plug 'jacoborus/tender.vim'
call plug#end()

syntax on
set path=*/**

" coc-vim plugins
let g:coc_global_extensions = [ 'coc-snippets', 'coc-tsserver', 'coc-tslint', 'coc-css', 'coc-lists', 'coc-highlight', 'coc-json', 'coc-yaml', 'coc-diagnostic', 'coc-pyright', 'coc-html', 'coc-explorer', 'coc-pairs', 'coc-marketplace']

autocmd! GUIEnter * set vb t_vb=
"let g:copilot_node_command = "/opt/homebrew/opt/node@16/bin/node"
" let g:coc_node_path='/nail/home/grzegorz/.nvm/versions/node/v16.19.0/bin/node'
"set laststatus=0
