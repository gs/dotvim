"map ,a :Ag 
"map Q :bd!<cr>
"
"map <space> :nohl<cr>
"nmap <leader>d :bprevious<CR>:bdelete #<CR>
"
"command W w
"nnoremap <silent> ≤ :bprevious<CR>
"nnoremap <silent> ≥ :bnext<CR>
"
"map <Tab> <Esc>yiw:tjump <C-R>"<CR>
"map ,nn :e ~/Google\ Drive/project_notes/notes.txt<cr>
"map <c-i> <esc>yiw:tjump <c-r>"<cr>
"map ?? :CtrlPMRUFiles<cr>
"map ,r :CtrlPBufTag<cr>
"map ,b :CtrlPBuffer<cr>
"map <C-s> <esc>:w<CR>
"imap <C-s> <esc>:w<CR>
"map <C-t> <esc>:tabnew<CR>
"map ,F <esc>:tjump 
"map <C-x> <C-w>c
"nnoremap \ ;
"nnoremap ; :
map ,a :Ag
map Q :bd!<cr>

map <space> :nohl<cr>
nmap <leader>d :bprevious<CR>:bdelete #<CR>

command W w
map ?? :CommandTJump<cr>
"map ,r :CtrlPBufTag<cr>
map ,b :CommandTBuffer<cr>
nnoremap <C-p> :CommandT<cr>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
"map <C-t> <esc>:tabnew<CR>
map ,F <esc>:tjump 
map <C-x> <C-w>c
nnoremap \ ;
nnoremap ; :
map <Tab> <Esc>yiw:tjump <C-R>"<CR>
map ,t :CommandT yelp/tests/<cr>
