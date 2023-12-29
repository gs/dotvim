" Mappings
"" use `;` as `:`
nnoremap \ ;
nnoremap ; :
map j gj
map k gk
tnoremap <Esc> <C-\><C-n>
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
"imap <c-l> <space>=><space>
"  Enter to Run tests
map <cr> <esc>:wa!\|:TestFile<cr>
"  Test Runners
map ,tf <esc>:wa!\|:TestFile<cr>
map ,tt <esc>:wa!\|:TestNearest<cr>
map ,ts <esc>:wa!\|:TestSuite<cr>
" Map jj to save
imap jj <ESC>:w!<cr>

" Codium
imap <script><silent><nowait><expr> <C-l> codeium#Accept()
imap <C-;>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-x>   <Cmd>call codeium#Clear()<CR>
