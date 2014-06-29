map ,fp <esc>yiw:Ag <c-r>" -G .py\|grep -v templates<cr>
map ,ft <esc>yiw:Ag <c-r>" -G .tmpl<cr>
map ,fT <esc>yiw:Ag <c-r>" -G _test.py<cr>

"map ,w <esc>:w!\|!scp % dev14-devc:/nail/home/grzegorz/pg/loc/%<cr>

function SyncMe()
    exec ':write'
    let file = expand('%')
    exec ':silent! !scp ' . file . ' dev14-devc:/nail/home/grzegorz/pg/loc/'.file
    redraw!
endfunction

set wildignore+=build/**,templates/*.py*,mobile_templates/*.py*,biz_templates/*.py*,admin_templates/*.py*,lite_templates/*.py*

map ,w :call SyncMe()<cr>
