map <space>pp :CommandT<cr>
map <space>sj :BTags<cr>
map <space>ss :BLines<cr>
"cmmands
map <space>!! :Dispatch 
nnoremap \ ;
nnoremap ; :
nnoremap  <space>/ :Ag 
map j gj
map k gk
nnoremap <space>sd :YcmCompleter GoToDeclaration<cr>
nnoremap <space>se :YcmCompleter GoToDefinition<cr>
nnoremap <space>sr :YcmCompleter GoToReferences<cr>
nnoremap <space>sR :YcmCompleter RestartServer<cr>
" visually select the text that was last edited or pasted
nnoremap gV `[v`]

" emulate selection of nearest search result in Vim < 7.4
if v:version < 704
  nnoremap gn //e<Return>v??<Return>
  nnoremap gN ??e<Return>v??<Return>
endif

