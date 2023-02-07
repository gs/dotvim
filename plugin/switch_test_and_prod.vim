""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! AlternateRbFile(file_name)
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<workers\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1  || match(current_file, '\<services\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    endif
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    endif
  endif
  return new_file
endfunction

"command! A :call OpenTestAlternate()

function! FindAlternateFileRb(file_name)
  exec ':e ' .  AlternateRbFile(a:file_name)
endfunction


function! FindAlternateFilePy(file_name)
  if match(a:file_name, '_test.py') != -1
    return substitute(a:file_name, '_test.py', '.py', '')
  else
    return substitute(a:file_name, '.py', '_test.py', '')
  endif
endfunction


function GetAlternateFileName()
  let file_name = expand("%:t")
  if match(file_name, '.py') != -1
    echo 'python'
    return FindAlternateFilePy(file_name)
  elseif match(file_name, '.rb') != -1
    echo 'ruby'
    return FindAlternateFileRb(file_name)
  else
    echo 'unknown'
    return ''
  endif
endfunction

function! OpenAlterateFile(how='')
  let alternate_file = GetAlternateFileName() 
  if len(alternate_file) == 0
    echo "Don't know how to find alternate for " . expand("%:t")
    return
  endif
  if a:how != ''
    exec a:how
  endif
  exec 'find ' . alternate_file
endfunction

command! A :call OpenAlterateFile()
command! AV :call OpenAlterateFile('vsp')
command! AS :call OpenAlterateFile('sp')

