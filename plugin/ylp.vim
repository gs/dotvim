map ,fp <esc>yiw:Ag --ignore='*template*' <c-r>" -G .py<cr>
map ,ft <esc>yiw:Ag <c-r>" -G .tmpl<cr>
map ,fT <esc>yiw:Ag <c-r>" -G _test.py<cr>
map ,fj <esc>yiw:Ag <c-r>" -G .js<cr>
map ,fc <esc>yiw:Ag <c-r>" -G css<cr>

"map ,w <esc>:w!\|!scp % dev14-devc:/nail/home/grzegorz/pg/loc/%<cr>

if system("uname") == "Darwin\n"
    :map ,np :e /Volumes/YelpNotes/
else
    :map ,np :e ~/yelp_notes/
endif

function SyncMe()
    exec ':write'
    let file = expand('%')
    exec ':silent !scp ' . file . ' dev14-devc:/nail/home/grzegorz/pg/loc/'.file
    exec ':silent !terminal-notifier  -title "VIM YELP" -message "file synced....."'
    redraw!
endfunction

map ,w :call SyncMe()<cr>

set wildignore+=build/**,templates/*.py*,mobile_templates/*.py*,biz_templates/*.py*,admin_templates/*.py*,lite_templates/*.py*
