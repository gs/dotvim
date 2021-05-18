"" Download vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
"Completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Files
    Plug 'liuchengxu/vim-clap'
"Git
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-salve.git'
    Plug 'tpope/vim-projectionist'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-fireplace'

"Ruby 
    Plug 'tpope/vim-rails'
    Plug 'tpope/vim-rake'
    Plug 'vim-ruby/vim-ruby'

"General
    Plug 'jiangmiao/auto-pairs'
    Plug 'kien/rainbow_parentheses.vim'
    Plug 'honza/vim-snippets'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-salve'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'gs/muon-dark'
    Plug 'eraserhd/parinfer-rust', {'do':
          \  'cargo build --release'}
"Clojure
    Plug 'guns/vim-clojure-static'
    Plug 'guns/vim-clojure-highlight'
    Plug 'guns/vim-sexp',    {'for': 'clojure'}
    Plug 'liquidz/vim-iced', {'for': 'clojure'}
    Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}

"JSX
    Plug 'chemzqm/vim-jsx-improve'

"Syntax check
    Plug 'w0rp/ale'
call plug#end()

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
syntax enable
tnoremap <Esc> <C-\><C-n>
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
set autoindent
set autoread              " auto read files changed outside vim
set clipboard=unnamed     " use the system clipboard
"set colorcolumn=80        " highlight max length column
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
map ,r <esc>yiw\|:CocSearch <c-r>"

" Run Clap
map ,C <esc>:Clap<cr>

" list files
map ,f <esc>:Clap files<cr>
"" currently opened buffers
map ,cb <esc>:Clap buffers<cr>

"" all tags
map ,ct <esc>:Tags<cr>

map ,cl <esc>:Clap blines<cr>

"" Install coc-vim plugins
function Cocplugins()
  :CocInstall coc-snippets coc-tsserver coc-prettier coc-eslint coc-tslint coc-css coc-lists coc-highlight \
  coc-json coc-yaml coc-conjure coc-solargraph coc-diagnostic coc-tabnine
endfunction

command! Cocplugininstall :call Cocplugins()
let maplocalleader = "\\"
let mapleader = ","
"clojure mappings: \ee (execute current) \er (executer outside)

let g:coc_global_extensions = ['coc-conjure', 'coc-solargraph']

" Show line number
"set nu
" Use relative number
"set relativenumber
" Use local path (:find filename)
set path=*/**
" Example configuration
nmap <Leader>bj <Plug>(coc-bookmark-next)
nmap <Leader>bk <Plug>(coc-bookmark-prev)
set omnifunc=syntaxcomplete#Complete
autocmd! GUIEnter * set vb t_vb=
let g:iced_enable_default_key_mappings = v:true " Default keybindings
let g:sexp_mappings = {'sexp_indent': '', 'sexp_indent_top': ''}
"Search
nnoremap <leader><leader> :CocSearch 
set termguicolors
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
colorscheme tir_black
let g:clap_layout = { 'relative': 'editor' }
let g:clap_theme = 'tir_black'
