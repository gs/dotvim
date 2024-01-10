function! CreateCheckbox()
  let line = getline('.')
  if line =~ '^\[ \]'
    let line = substitute(line, '^\[ \]', '[x]', '')
  elseif line =~ '^\[x\]'
    let line = substitute(line, '^\[x\]', '[ ]', '')
  else
    let line = '[ ] ' . line
  endif
  call setline('.', line)
endfunction



