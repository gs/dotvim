" custom command to enter the todays date into the buffer
function! Today()
    :pu='[[' . strftime('%Y-%m-%d') . ']]'
endfunction
command! Today :call Today()
