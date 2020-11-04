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
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
    Plug 'lvht/fzf-mru'
    Plug 'junegunn/fzf.vim'
"Git
    Plug 'tpope/vim-fugitive'

"    Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
"Ruby 
    Plug 'tpope/vim-rails'
    Plug 'tpope/vim-rake'
    Plug 'vim-ruby/vim-ruby'

"General
    Plug 'jiangmiao/auto-pairs'
    Plug 'kien/rainbow_parentheses.vim'
    Plug 'honza/vim-snippets'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'jceb/vim-orgmode'
    Plug 'rakr/vim-one'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-salve'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'eraserhd/parinfer-rust', {'do':
        \  'cargo build --release'}
"Clojure
    Plug 'Olical/conjure', {'tag': 'v4.6.0'}
    Plug 'clojure-vim/vim-cider'
    Plug 'guns/vim-clojure-static'
    Plug 'guns/vim-clojure-highlight'
    Plug 'tpope/vim-fireplace'
    Plug 'clojure-vim/async-clj-omni'

"JSX
    Plug 'chemzqm/vim-jsx-improve'
call plug#end()

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
syntax enable
tnoremap <Esc> <C-\><C-n>
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'
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

" My functions
"command! -bang -nargs=* Find
"  \ call fzf#vim#grep(
"  \   'git grep --line-number '.shellescape(<q-args>), 0,
"  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)
"
function! Today()
    :pu='* ' . strftime('%y/%m/%d')
endfunction
command! Today :call Today()

" My mappings
map ,!! :Dispatch
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
map ,r <esc>yiw\|:Rg <c-r>"
map ,s <esc>:Find 
"" FZF files
map ,f <esc>:Files<cr>
"" FzfMru (most recently used files)
map ,F <esc>:FZFMru<cr>
"" currently opened buffers
map ,b <esc>:Buffers<cr>
"" tags from current buffer
map ,t <esc>:BTags<cr>
"" all tags
map ,T <esc>:Tags<cr>
"colorscheme muon
colorscheme tir_black
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#313343 gui=NONE

"" Install coc-vim plugins
function Cocplugins()
  :CocInstall coc-snippets coc-tsserver coc-prettier coc-eslint coc-tslint coc-css coc-lists coc-highlight coc-json coc-yaml coc-conjure coc-solargraph coc-diagnostic
endfunction

command! Cocplugininstall :call Cocplugins()
let maplocalleader = "\\"
"clojure mappings: \ee (execute current) \er (executer outside)


"let g:LanguageClient_serverCommands = {
"      \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"      \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"      \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"      \ 'python': ['/usr/local/bin/pyls'],
"      \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"      \ 'clojure': ['bash', '-c', 'clojure-lsp'],
"\ }
"

:nmap ,x :CocCommand explorer<CR>

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
