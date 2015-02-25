map ?? :CtrlPMRUFiles<cr>
map ,r :CtrlPBufTag<cr>
map ,b :CtrlPBuffer<cr>
map ,a :Ag
map Q :bd!<cr>
map <space> :nohl<cr>
nmap <leader>d :bprevious<CR>:bdelete #<CR>
command W w
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map ,F <esc>:tjump 
map <C-x> <C-w>c
nnoremap \ ;
nnoremap ; :
map <Tab> <Esc>yiw:tjump <C-R>"<CR>
