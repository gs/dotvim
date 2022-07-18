" custom command to enter the todays date into the buffer
function! Today()
    :pu='* ' . strftime('%y/%m/%d')
endfunction
command! Today :call Today()
