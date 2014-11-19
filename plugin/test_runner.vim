""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MapCR()
  nnoremap <cr> :call RunTestFile()<cr>
endfunction
call MapCR()
"nnoremap <leader>T :call RunNearestTest()<cr>
"noremap <leader>t :call RunTests('')<cr>
"noremap <leader>c :w\|:!script/features<cr>
"noremap <leader>w :w\|:!script/features --profile wip<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\|_test.py\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    if match(expand("%"), '_spec\.rb$') != -1
        let spec_line_number = line('.')
        call RunTestFile(":" . spec_line_number)
    elseif match(expand("%"), '_test\.rb$') != -1
        exec ":!ruby " . FindRubyTest(expand("%"))
    endif
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! FindRubyTest(filename)
  let func_no = search('\s*def\stest\_\w\+\ze' , 'bcn')
  let end_no  = search('\s*end$', 'bcn')
  if func_no < end_no && end_no != line('.')
      return a:filename
  else
      let func = getline(func_no)
      let func = substitute(func,'\s*def\s', '', 'g')
      return a:filename . " -n " . func
  endif
endfunction


function! FindTest()
  let cls_regexp = '^class\s\zs\w\+\ze'
  let func_regexp = 'def\stest\_\w\+\ze'

  let func_line = search(func_regexp, 'bn', line("w0"))
  let func = getline(search(func_regexp, 'bn'))
  let func = substitute(func,'\s*def\s', '', 'g')
  let func = substitute(func,'(.*):', '', 'g')

  let cls_line = search(cls_regexp, 'bn', line("w0"))
  let cls = getline(search(cls_regexp, 'bn'))
  let cls = substitute(cls,'class\s', '', 'g')
  let cls = substitute(cls,'(.*):', '', 'g')

  if cls_line > func_line || func == ""
    return cls
  else
    return cls . "." . func
  endif

endfunction

function! RunTests(filename)
  " Write the file and run tests for the given filename
  if expand("%") != ""
    :w
  end
  if match(a:filename, '\.feature$') != -1
    exec ":!script/features " . a:filename
  else
    if match(a:filename, '_test\.rb$') != -1
      exec ":!ruby " . FindRubyTest(a:filename)
    elseif match(a:filename, '_test\.py$') != -1
      let tst = FindTest()
      if system("uname") == "Darwin\n"
        exec ":silent !echo testify " . a:filename . " " . tst . " |pbcopy"
      else
        if $YELP_IN_SANDBOX == 1
          silent! exec ":!tmux splitw -p 30 && tmux send-key testify '" . " '" . a:filename ."' '" . tst
        else
          exec ":silent !echo testify " . a:filename . " " . tst . " > .tests"
        endif
      endif
    else
      " First choice: project-specific test script
      if filereadable("script/test")
        exec ":!script/test " . a:filename
        " Fall back to the .test-commands pipe if available, assuming someone
        " is reading the other side and running the commands
      elseif filewritable(".test-commands")
        let cmd = 'rspec --color --format progress --require "~/lib/vim_rspec_formatter" --format VimFormatter --out tmp/quickfix'
        exec ":!echo " . cmd . " " . a:filename . " > .test-commands"

        " Write an empty string to block until the command completes
        sleep 100m " milliseconds
        :!echo > .test-commands
        redraw!
        " Fall back to a blocking test run with Bundler
      elseif filereadable("Gemfile")
        exec ":!bundle exec rspec --color " . a:filename
        " Fall back to a normal blocking test run
      else
        exec ":!rspec --color " . a:filename
      end
    end
  end
endfunction



