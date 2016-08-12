"map <leader>t :CtrlP yelp/tests/<cr>
"map <leader>S :Start! syncpg<cr>
"map <leader>Y :Start! ytags<cr>
:autocmd FileType htmlcheetah set omnifunc=htmlcomplete#CompleteTags

if system("uname") == "Darwin\n"
    :map <space>ypn :CommandT /Volumes/YelpNotes/<cr>
else
    :map <space>ypn :CommandT ~/yelp_notes/<cr>
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

"map <leader>w :call SyncMe()<cr>
"map :w :call SyncMe()<cr>
map <C-s> :call SyncMe()<cr>
"map <leader>s :call SyncMe()<cr>

function BuildMe()
    :Start! sent-to-pg make
endfunction
map <leader>mm  :call BuildMe()<cr>
set wildignore+=build/**,templates/*.py*,mobile_templates/*.py*,biz_templates/*.py*,admin_templates/*.py*,lite_templates/*.py*


function SentToPg()
    :!sent-to-pg
endfunction

function OpenGrok()
    :!open https://opengrok.yelpcorp.com/xref/yelp-main/%
endfunction
function OpenGrokLine()
    let line_nr = % . line('.')
    exec ":echom ". line_nr
    exec ":echo \"https://opengrok.yelpcorp.com/xref/yelp-main/\""line_nr
    " echo "https://opengrok.yelpcorp.com/xref/yelp-main/". % .  "#" . line_nr
    "    :!open 
endfunction

"yelp project
map <space>yp :cd ~/pg/yelp-main<cr>
map <space>yog :call OpenGrok()<cr>
map <space>yogl :call OpenGrokLine()<cr>
map <space>syp <esc>yiw:Ag -U --ignore='*template*' <c-r>" -Q .py<cr>
map <space>syt <esc>yiw:Ag -U <c-r>" -Q .tmpl<cr>
map <space>syT <esc>yiw:Ag -U <c-r>" -Q _test.py<cr>
map <space>syj <esc>yiw:Ag -U <c-r>" -Q .js<cr>
map <space>syc <esc>yiw:Ag -U <c-r>" -Q css<cr>
"map <space>pT :CommandT yelp/tests/<cr>
