" Download vim-plug if missing
if has('nvim')
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif
endif

call plug#begin('~/.vim/plugged')
    Plug 'chemzqm/vim-jsx-improve'
    Plug 'clojure-vim/vim-cider'
    Plug 'guns/vim-clojure-static'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
    Plug 'junegunn/fzf.vim'
    Plug 'luochen1990/rainbow'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-classpath'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-fireplace'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rails'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-salve'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'vim-ruby/vim-ruby'
    Plug 'w0rp/ale'
    Plug 'wting/cheetah.vim'
    Plug 'zxqfl/tabnine-vim'
    Plug 'eraserhd/parinfer-rust', {'do':
        \  'cargo build --release'}
call plug#end()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
syntax enable
tnoremap <Esc> <C-\><C-n>
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/Users/sfistak/.pyenv/shims/python3'
let vimclojure#HighlightBuiltins=1 
let vimclojure#ParenRainbow=1
let g:rainbow_active = 1
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
set tabstop=2             " change default tab length
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#313343 gui=NONE
let &shell="/bin/bash -l"

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
map <space>!! :Dispatch  
nnoremap \ ;
nnoremap ; :
map j gj
map k gk
map <space>bd :bp\|bd#<cr>
map ,b :ls<cr>:buf 
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
map ,r <esc>yiw\|:Find <c-r>"
