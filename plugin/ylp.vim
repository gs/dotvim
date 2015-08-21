map ,t :CtrlP yelp/tests/<cr>

map ,fp <esc>yiw:Ag -U --ignore='*template*' <c-r>" -G .py<cr>
map ,ft <esc>yiw:Ag -U <c-r>" -G .tmpl<cr>
map ,fT <esc>yiw:Ag -U <c-r>" -G _test.py<cr>
map ,fj <esc>yiw:Ag -U <c-r>" -G .js<cr>
map ,fc <esc>yiw:Ag -U <c-r>" -G css<cr>
:autocmd FileType htmlcheetah set omnifunc=htmlcomplete#CompleteTags

if system("uname") == "Darwin\n"
    :map ,np :CtrlP /Volumes/YelpNotes/<cr>
else
    :map ,np :CtrlP ~/yelp_notes/<cr>
endif

function SyncMe()
    let user = 'grzegorz'
    exec ':write'
    let full_path = expand('%:p')
    let in_yelp = match(full_path, '\.*'.user.'\/pg.') != -1
    if in_yelp 
        let file = expand('%:p')
        let copy_path = substitute(full_path, '/Users/', '', 'g')
        exec ":Start! sent-to-pg " . full_path  copy_path 
       redraw!
    else
        echo 'not in yelp'
        exec ':Start! terminal-notifier  -title "YELP" -message "not in yelp"'
    endif
endfunction

map ,w :call SyncMe()<cr>
map <LC-s> :call SyncMe()<cr>

function BuildMe()
    :Start! sent-to-pg make
endfunction
map ,mm  :call BuildMe()<cr>
set wildignore+=build/**,templates/*.py*,mobile_templates/*.py*,biz_templates/*.py*,admin_templates/*.py*,lite_templates/*.py*


function SentToPg()
    :!sent-to-pg
endfunction
