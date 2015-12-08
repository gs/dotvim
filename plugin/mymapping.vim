map ?? :CtrlPMRUFiles<cr>
map <leader>r :CtrlPBufTag<cr>
map <leader>b :CtrlPBuffer<cr>
map <leader>a :Ag  
map Q :bd!<cr>
map <space> :nohl<cr>
nmap <leader>d :bprevious<CR>:bdelete #<CR>
command W w
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <leader>F <esc>:tjump 
map <C-x> <C-w>c
nnoremap \ ;
nnoremap ; :
map <Tab> <C-]>
map <leader>s :Start
map <C-w>O :tabe %<cr>
"map <C-t> :CtrlP<cr>
nnoremap <leader>k :bp<cr>
nnoremap <leader>l :bn<cr>
map <leader>fr :!fandr 
map <leader>t :CommandT<cr>
:map <leader>c :Dispatch 
