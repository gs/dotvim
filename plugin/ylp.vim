"map <leader>t :CtrlP yelp/tests/<cr>
map <leader>T :CommandT yelp/tests/<cr>
map <leader>S :Start! syncpg<cr>
map <leader>Y :Start! ytags<cr>

map <leader>fp <esc>yiw:Ag -U --ignore='*template*' <c-r>" -G .py<cr>
map <leader>ft <esc>yiw:Ag -U <c-r>" -G .tmpl<cr>
map <leader>fT <esc>yiw:Ag -U <c-r>" -G _test.py<cr>
map <leader>fj <esc>yiw:Ag -U <c-r>" -G .js<cr>
map <leader>fc <esc>yiw:Ag -U <c-r>" -G css<cr>
:map gy :cd ~/pg/yelp-main<cr>
:autocmd FileType htmlcheetah set omnifunc=htmlcomplete#CompleteTags

if system("uname") == "Darwin\n"
    :map <leader>np :CommandT /Volumes/YelpNotes/<cr>
else
    :map <leader>np :CommandT ~/yelp_notes/<cr>
endif

function SyncMe()
    let user = 'grzegorz'
    exec ':write'
    let full_path = expand('%:p')
    let in_yelp = match(full_path, '\.*'.user.'\/pg.') != -1
    if in_yelp 
        let file = expand('%:p')
        let copy_path = substitute(full_path, '/Users/', '', 'g')
        exec ":Start! ~/bin/sent-to-pg " . full_path  copy_path 
       redraw!
    else
        echo 'not in yelp'
        exec ':Start! /usr/local/bin/terminal-notifier  -title "YELP" -message "not in yelp"'
    endif
endfunction

map <leader>w :call SyncMe()<cr>
map :w :call SyncMe()<cr>
map <C-s> :call SyncMe()<cr>
map <leader>s :call SyncMe()<cr>

function BuildMe()
    :Start! sent-to-pg make
endfunction
map <leader>mm  :call BuildMe()<cr>
set wildignore+=build/**,templates/*.py*,mobile_templates/*.py*,biz_templates/*.py*,admin_templates/*.py*,lite_templates/*.py*


function SentToPg()
    :!sent-to-pg
endfunction


map og :!open https://opengrok.yelpcorp.com/xref/yelp-main/%<cr>
