map ,fp <esc>yiw:Ag -U --ignore='*template*' <c-r>" -G .py<cr>
map ,ft <esc>yiw:Ag -U <c-r>" -G .tmpl<cr>
map ,fT <esc>yiw:Ag -U <c-r>" -G _test.py<cr>
map ,fj <esc>yiw:Ag -U <c-r>" -G .js<cr>
map ,fc <esc>yiw:Ag -U <c-r>" -G css<cr>

"map ,w <esc>:w!\|!scp % dev14-devc:/nail/home/grzegorz/pg/loc/%<cr>

if system("uname") == "Darwin\n"
    :map ,np :e /Volumes/YelpNotes/
else
    :map ,np :e ~/yelp_notes/
endif

function SyncMe()
    let user = 'grzegorz'
    exec ':write'
    let full_path = expand('%:p')
    let in_yelp = match(full_path, '\.*'.user.'\/pg.') != -1
    if in_yelp 
        let file = expand('%:p')
        let copy_path = substitute(full_path, '/Users/', '', 'g')
        "exec ':silent !scp ' . file . ' dev14-devc:/nail/home/grzegorz/pg/loc/'.file . '&'
        "exec ':silent !terminal-notifier  -title "VIM YELP" -message "file synced....."'
        "exec ":silent !sent-to-pg " . full_path  copy_path . "&"
        exec ":silent !sent-to-pg " . full_path  copy_path 
       redraw!
    else
        echo 'not in yelp'
    endif
endfunction

map ,w :call SyncMe()<cr>
map <c-s> :call SyncMe()<cr>

function BuildMe()
    :silent !sent-to-pg make &
    :redraw!
endfunction
map ,mm  :call BuildMe()<cr>
set wildignore+=build/**,templates/*.py*,mobile_templates/*.py*,biz_templates/*.py*,admin_templates/*.py*,lite_templates/*.py*


function SentToPg()
    :!sent-to-pg
endfunction
