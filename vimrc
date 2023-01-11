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
   Plug 'tpope/vim-surround'
"Theme
    Plug 'jacoborus/tender.vim'
call plug#end()

syntax on
tnoremap <Esc> <C-\><C-n>
let g:python3_host_prog = expand(systemlist('which python3')[0])

set autoindent
set autoread              " auto read files changed outside vim
set colorcolumn=90        " highlight max length column
set encoding=utf-8        " set encoding
set expandtab             " tabs to spaces
set formatoptions+=j
set hidden                " allow background buffers
set hlsearch              " highlight the search query
set incsearch             " highlight matching strings
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
set number               " set line number
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%) " line status
set path=*/**             " Use local path (:find filename)
set background=dark
set cursorline

color tender
"
" coc-vim plugins
let g:coc_global_extensions = [ 'coc-solargraph', 'coc-snippets', 'coc-tsserver', 'coc-prettier', 'coc-tslint', 'coc-css', 'coc-lists', 'coc-highlight', 'coc-json', 'coc-yaml', 'coc-diagnostic', 'coc-tabnine', 'coc-pyright', 'coc-html', 'coc-explorer', 'coc-pairs']

autocmd! GUIEnter * set vb t_vb=
"let g:copilot_node_command = "/opt/homebrew/opt/node@16/bin/node"

" Mappings
"" use `;` as `:`
nnoremap \ ;
nnoremap ; :
map j gj
map k gk
"" Kill current buffer
map ,D :bp\|bd#<cr>
"" expand current path
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
"" expand current path in split
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
"" find word under cursor
let maplocalleader = "\\"
let mapleader = ","
"Insert  =>
imap <c-l> <space>=><space>
"  Enter to Run tests
map <cr> <esc>:wa!\|:TestFile<cr>
"  Test Runners
map ,tf <esc>:wa!\|:TestFile<cr>
map ,tt <esc>:wa!\|:TestNearest<cr>
map ,ts <esc>:wa!\|:TestSuite<cr>
" Rspec specific
map <leader>p :PromoteToLet<cr>
" Fix spelling
nmap <leader>a <Plug>(coc-codeaction-selected)
" File Explorer
map ,X :CocCommand explorer<cr>

" Map jj to save
imap jj <ESC>:w!<cr>
" let g:coc_node_path='/nail/home/grzegorz/.nvm/versions/node/v16.19.0/bin/node'
"set laststatus=0
