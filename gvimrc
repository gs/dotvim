"set guifont=Source\ Code\ Pro:h13
set guifont=Fira\ Code:h11
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guioptions+=e
set vb
colo lighttable
hi Pmenu ctermfg=0 ctermbg=6 guibg=#444444
hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff
:map <C-t> :CommandT<cr>
:map <D-[> :bp<cr>
:map <D-]> :bn<cr>
