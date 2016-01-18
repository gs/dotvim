"windows naviation
"map <space>w

map <space>wv <c-w>v
map <space>ws <c-w>s
map <space>wh <c-w>h
map <space>wj <c-w>j
map <space>wk <c-w>k
map <space>wl <c-w>l
map <space>wm <c-w>o
map <space>wM :tabe %<cr>
map <space>wH <c-w>H
map <space>wK <c-w>K
map <space>wx <c-w>c
map <space>wq :bd!
map <space>w= <c-w>=
map <space>wc :cclose<cr>
map <space>ww :cwindow<cr>
map <space>wn <c-w>w



"buffers
"map <space>b
map <space>bn   :bnext<cr>
map <space>bp   :bprevious<cr>
map <space>bb   :Unite -start-insert buffer<cr>
map <space>bl   :ls<cr>
map <space>bd   :bprevious<CR>:bdelete #<CR>
"map <space>bd!  :bd!<cr>
map <space>bD :!rm -i %<cr>
"files naviagation
"map <space>p
map <space>pf :Unite -start-insert file_rec/async:!<cr>
map <space>pp :Unite -resume -buffer-name=project -no-restore -input= -start-insert -hide-source-names -unique file_rec/git:--cached:--others:--exclude-standard<cr>
map <space>pr :Unite -start-insert file_mru<cr>
map <space>pb :Unite -start-insert buffer<cr>
map <space>pe :edit %%
map <space>pv :view %%

"in file
"map <space>f
map <space>fm :Unite -buffer-name=outline -auto-highlight outline -start-insert<cr>
map <space>fs :w!<cr>
map <space>fj <c-]>
map <space>fA :PairFileEdit<cr>
map <space>fa <esc>yiw :Ag -U <c-r>"\ \{0,1\}= -G %<cr>
map <space>fr <esc>yiw :Ag -U <c-r>"<cr>
map <space>fR :call RenameFile()<cr>

"search 
map <space>/ :Ggrep 
map <space>sc :nohl<cr>
map <space>sj :tjump 
map <space>sr :!fandr 
map <space>ss :Unite line -start-insert<cr>
"commands
map <space>! :Dispatch 

"git
" <space>g
map <space>gd :Gdiff<cr>
map <space>gst :Git status<cr>
map <space>gSs :Git stash save<cr>
map <space>gSp :Git stash pop<cr>
map <space>gcm :Git commit -m 
map <space>ga :Git add -p
map <space>gb :Gblame<cr>
map <space>gomf :call OpenChangedFiles()<cr>

"quit
map <space>q :q
map <space>qq :qa!
nnoremap \ ;
nnoremap ; :
map j gj
map k gk


" visually select the text that was last edited or pasted
nnoremap gV `[v`]

" emulate selection of nearest search result in Vim < 7.4
if v:version < 704
  nnoremap gn //e<Return>v??<Return>
  nnoremap gN ??e<Return>v??<Return>
endif

