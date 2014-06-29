function PythonSettings()
    let python_highlight_all = 1
    set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    set formatoptions=cq textwidth=72 foldignore= wildignore+=*.py[co]
    au filetype python set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    let g:pymode_lint_ignore= 'E101,W191,E501,E126,E261,E231,E128,W601'
    let g:pymode_folding = 0
endfunction

autocmd FileType python call PythonSettings()
