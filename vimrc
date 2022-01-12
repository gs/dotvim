"" Download vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
" Syntax issues highlight
    Plug 'w0rp/ale'
" Tab to complete
    Plug 'ervandew/supertab'
"Files
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
"Git
    Plug 'tpope/vim-fugitive'
"Test Runners
    Plug 'vim-test/vim-test'
"General
   Plug 'honza/vim-snippets'
   Plug 'tpope/vim-repeat'
   Plug 'tpope/vim-surround'
"JSX
    Plug 'chemzqm/vim-jsx-improve'
call plug#end()

syntax on
tnoremap <Esc> <C-\><C-n>
" Dynamically search for python "
let g:python_host_prog = expand(systemlist('which python')[0])
let g:python3_host_prog = expand(systemlist('which python3')[0])

set autoindent            " auto indentation
set autoread              " auto read files changed outside vim
set colorcolumn=90        " highlight max length column
set encoding=utf-8        " set encoding
set expandtab             " tabs to spaces
set formatoptions+=j
set hidden                " allow background buffers
set hlsearch              " highlight the search query
set incsearch             " inc search (highlight and search)
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


" Add a current date to the buffer (used for ORG and my docs) "
function! Today()
    :pu='* ' . strftime('%y/%m/%d')
endfunction
command! Today :call Today()

" My mappings
"" use `;` as `:`
nnoremap \ ;
nnoremap ; :

" Better navigation
map j gj
map k gk
"" Kill current buffer
map ,D :bp\|bd#<cr>
"" expand current path
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
"" expand current path in split
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
"" find word under cursor
map ,. <esc>yiw\|:Rg <c-r>"

"" Global search
map ,/ <esc>:Rg <cr>
" list files
map ,f <esc>:Files<cr>
"" currently opened buffers
map ,b <esc>:Buffers<cr>

" Map local leader to \\
let maplocalleader = "\\"
" Map leader to ,
let mapleader = ","
" Show line number
set nu
" Use relative number
set relativenumber
" Use local path (:find filename)
set path=*/**
" Set status line
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
set complete-=i
set completeopt=menu,menuone,noselect
let python_highlight_all=1
" Push the FZF results into the bottom
let g:fzf_layout = { 'down': '~40%' }
" Map Enter to Run Test file
map <CR> :TestFile<cr>
