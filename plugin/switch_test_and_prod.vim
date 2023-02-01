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
  let file_name = a:file_name
  let is_test = match(file_name, '_test.py') != -1
  if is_test
    return substitute(file_name, '_test.py', '.py', '')
  endif
  return substitute(file_name, '.py', '_test.py', '')
endfunction


function GetAlternateFileName()
  let file_name = expand("%:t")
  if match(file_name, '.py') != -1
    echo 'python'
    return FindAlternateFilePy(file_name)
  elseif match(file_name, '.rb') != -1
    echo 'ruby'
    return FindAlternateFileRb(file_name)
  endif
  echo 'unknown'
  return ''
endfunction

function! OpenAlterateFile() 
  let alternate_file = GetAlternateFileName() 
  if len(alternate_file) == 0
    echo "Don't know how to find alternate for " . expand("%:t")
    return
  endif
  exec 'find ' . alternate_file
endfunction

function! OpenAlterateFileVSplit() 
  let alternate_file = GetAlternateFileName()
  if len(alternate_file) == 0
    echo "Don't know how to find alternate for " . expand("%:t")
    return
  endif
  exec 'vsp'
  exec 'find ' . alternate_file
endfunction

command! A :call OpenAlterateFile()
command! AV :call OpenAlterateFileVSplit()


