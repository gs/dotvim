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
    Plug 'tpope/vim-rake'
    Plug 'vim-ruby/vim-ruby'
    Plug 'danchoi/ri.vim'
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
"HardMode
    Plug 'dusans/vim-hardmode'

"JSX
    Plug 'chemzqm/vim-jsx-improve'
    Plug 'leafOfTree/vim-svelte-plugin'
"Theme
    Plug 'gs/muon-dark'
call plug#end()

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
"set number               " set line number
"set relativenumber       " use relative line number
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%) " line status
set path=*/**             " Use local path (:find filename)
"completion 
"set completeopt=menu,preview
"set omnifunc=syntaxcomplete#Complete
"clojure mappings: \ee (execute current) \er (executer outside)

" coc-vim plugins
let g:coc_global_extensions = [ 'coc-conjure', 'coc-solargraph', 'coc-snippets', 'coc-tsserver', 'coc-prettier', 'coc-eslint', 'coc-tslint', 'coc-css', 'coc-lists', 'coc-highlight', 'coc-json', 'coc-yaml', 'coc-diagnostic', 'coc-tabnine', 'coc-pyright', 'coc-html', 'coc-spell-checker', 'coc-explorer']

autocmd! GUIEnter * set vb t_vb=
let g:iced_enable_default_key_mappings = v:true " Default keybindings
let g:sexp_mappings = {'sexp_indent': '', 'sexp_indent_top': ''}

color smyck

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
map <cr> <esc>:w!\|:TestFile<cr>
"  Test Runners
map ,tf :TestFile<cr>
map ,tt :TestNearest<cr>
map ,ts :TestSuite<cr>
map <leader>p :PromoteToLet<cr>
" Fix spelling
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
" File Explorer
map ,X :CocCommand explorer<cr>
