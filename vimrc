"" Download vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
"Completion and more
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Files
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
"Git
    Plug 'tpope/vim-fugitive'
"Test Runners
    Plug 'vim-test/vim-test'
"Ruby & Rails
    Plug 'tpope/vim-rails'
    Plug 'tpope/vim-rake'
    Plug 'vim-ruby/vim-ruby'
"General
   Plug 'honza/vim-snippets'
   Plug 'tpope/vim-repeat'
   Plug 'tpope/vim-surround'
   Plug 'jiangmiao/auto-pairs'
"Clojure
    Plug 'eraserhd/parinfer-rust', {'do':
          \  'cargo build --release'}
    Plug 'guns/vim-sexp',    {'for': 'clojure'}
    Plug 'liquidz/vim-iced', {'for': 'clojure'}
    Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}

"JSX
    Plug 'chemzqm/vim-jsx-improve'
call plug#end()

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
syntax on
tnoremap <Esc> <C-\><C-n>
let g:python_host_prog = expand(systemlist('which python')[0])
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

function! Today()
    :pu='* ' . strftime('%y/%m/%d')
endfunction
command! Today :call Today()

" My mappings
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
map ,. <esc>yiw\|:Rg <c-r>"

" list files
map ,f <esc>:Files<cr>
"" currently opened buffers
map ,b <esc>:Buffers<cr>

map ,/ <esc>:Rg <cr>

let maplocalleader = "\\"
let mapleader = ","
"clojure mappings: \ee (execute current) \er (executer outside)
let g:coc_global_extensions = ['coc-conjure', 'coc-solargraph', 'coc-snippets', 'coc-tsserver', 'coc-prettier', 'coc-eslint', 'coc-tslint', 'coc-css', 'coc-lists', 'coc-highlight', 'coc-json', 'coc-yaml', 'coc-diagnostic', 'coc-tabnine', 'coc-pyright', 'coc-html']

" Show line number
set nu
" Use relative number
set relativenumber
" Use local path (:find filename)
set path=*/**
" Example configuration
nmap <Leader>bj <Plug>(coc-bookmark-next)
nmap <Leader>bk <Plug>(coc-bookmark-prev)
set omnifunc=syntaxcomplete#Complete
autocmd! GUIEnter * set vb t_vb=
let g:iced_enable_default_key_mappings = v:true " Default keybindings
let g:sexp_mappings = {'sexp_indent': '', 'sexp_indent_top': ''}
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
set completeopt=menu,preview
highlight Pmenu ctermbg=gray guibg=gray
"Insert  =>
imap <c-l> <space>=><space>

" Push the FZF results into the bottom
let g:fzf_layout = { 'down': '~40%' }
" Map Enter to Run Test file
map <CR> :TestFile<cr>
