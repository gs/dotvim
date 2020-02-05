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
map ,bd :bp\|bd#<cr>
"" expand current path 
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
"" expand current path in split
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
"" find word under cursor
map ,r <esc>yiw\|:Find <c-r>"
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
colorscheme muon
"hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
"hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#313343 gui=NONE

"" Install coc-vim plugins
function Cocplugins()
  :CocInstall coc-snippets coc-tsserver coc-prettier coc-eslint coc-tslint coc-css coc-lists coc-highlight coc-json coc-yaml
endfunction

command! Cocplugininstall :call Cocplugins()

