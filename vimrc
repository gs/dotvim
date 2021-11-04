"" Download vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
    Plug 'w0rp/ale'
    Plug 'ervandew/supertab'
"Files
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
"Git
    Plug 'tpope/vim-fugitive'
"Test Runners
    Plug 'vim-test/vim-test'
    Plug 'alfredodeza/pytest.vim'
"Ruby & Rails
    Plug 'tpope/vim-rails'
    Plug 'tpope/vim-rake'
    Plug 'vim-ruby/vim-ruby'
"General
   Plug 'honza/vim-snippets'
   Plug 'tpope/vim-repeat'
   Plug 'tpope/vim-surround'
"Clojure
    Plug 'eraserhd/parinfer-rust', {'do':
          \  'cargo build --release'}
    Plug 'guns/vim-sexp',    {'for': 'clojure'}
    Plug 'liquidz/vim-iced', {'for': 'clojure'}
    Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}

"JSX
    Plug 'chemzqm/vim-jsx-improve'
    Plug 'romgrk/doom-one.vim'
    Plug 'flazz/vim-colorschemes'
call plug#end()

syntax on
tnoremap <Esc> <C-\><C-n>
let g:python_host_prog = expand(systemlist('which python')[0])
let g:python3_host_prog = expand(systemlist('which python3')[0])

set autoindent
set autoread              " auto read files changed outside vim
set clipboard=unnamed     " use the system clipboard
"set colorcolumn=90        " highlight max length column
set encoding=utf-8        " set encoding
set expandtab             " tabs to spaces
set formatoptions+=j
set hidden                " allow background buffers
set hlsearch              " highlight the search query
set ignorecase            " case insensitive searching
set laststatus=2          " always show airline
set lazyredraw            " don't redraw during macro execution
set mouse=a               " enable the mouse
set nobackup              " no backup files
set noshowmode            " doesn't show the current mode in the command bar
set noswapfile            " no swap files
set scrolljump=1          " scroll 1 line at a time
set scrolloff=5           " start scrolling 5 lines before bottom of pane
set shiftwidth=2          " shift lines by 2 characters
set smartcase             " only use case sensitive search when uppercase

function! Today()
    :pu='* ' . strftime('%y/%m/%d')
endfunction
command! Today :call Today()

" My mappings
map ,! :Dispatch
"" use `;` as `:`
nnoremap \ ;
nnoremap ; :
map j gj
map k gk
"" Kill current buffer
map ,D :bp\|bd#<cr>
"" expand current path
map ,E :e <C-R>=expand("%:p:h") . "/" <CR>
"" expand current path in split
map ,S :split <C-R>=expand("%:p:h") . "/" <CR>
"" find word under cursor
map ,r <esc>yiw\|:Rg <c-r>"

" list files
map ,f <esc>:Files<cr>
"" currently opened buffers
map ,b <esc>:Buffers<cr>
map ,t <esc>:BTags<cr>

map ,l <esc>:BLines<cr>
map ,L <esc>:Lines<cr>

map ,/ <esc>:Rg <cr>

let maplocalleader = "\\"
let mapleader = ","
"clojure mappings: \ee (execute current) \er (executer outside)

" Show line number
set nu
" Use relative number
set relativenumber
" Use local path (:find filename)
set path=*/**
let g:sexp_mappings = {'sexp_indent': '', 'sexp_indent_top': ''}
"Search
"set termguicolors
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
"set completeopt=menu,menuone,noselect
"colo doom-one
colo vibrantink
"let g:coc_node_path = "~/.linuxbrew/bin/node"
"lua require('github-theme').setup()
"let g:molokai_original = 1
let g:ale_completion_enabled = 1
