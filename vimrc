"" Download vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'chemzqm/vim-jsx-improve'
    Plug 'clojure-vim/vim-cider'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
    Plug 'lvht/fzf-mru'
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-fireplace'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-salve'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'guns/vim-clojure-static'
    Plug 'guns/vim-clojure-highlight'
    Plug 'eraserhd/parinfer-rust', {'do':
        \  'cargo build --release'}
    Plug 'rakr/vim-one'
    Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
    Plug 'justinmk/vim-sneak'
    Plug 'lilydjwg/colorizer'
    Plug 'clojure-vim/async-clj-omni'
    Plug 'Olical/conjure', {'tag': 'v3.4.0'}
    Plug 'bakpakin/fennel.vim'
call plug#end()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
syntax enable
tnoremap <Esc> <C-\><C-n>
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'
set autoindent
set autoread              " auto read files changed outside vim
set clipboard=unnamed     " use the system clipboard
set colorcolumn=80        " highlight max length column
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
let &shell="/usr/local/bin/bash -l"

" My functions
command! -bang -nargs=* Find
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

function! Today()
    :pu='* ' . strftime('%d/%m/%y')
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
map ,r <esc>yiw\|:Ag <c-r>"
map ,s <esc>:Ag
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
colorscheme one
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#313343 gui=NONE

"" Install coc-vim plugins
function Cocplugins()
  :CocInstall coc-snippets coc-tsserver coc-prettier coc-eslint coc-tslint coc-css coc-lists coc-highlight coc-json coc-yaml coc-conjure
endfunction

command! Cocplugininstall :call Cocplugins()
let maplocalleader = "\\"


let g:LanguageClient_serverCommands = {
      \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
      \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
      \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
      \ 'python': ['/usr/local/bin/pyls'],
      \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
      \ }


:nmap ,x :CocCommand explorer<CR>

let g:coc_global_extensions = ['coc-conjure']
