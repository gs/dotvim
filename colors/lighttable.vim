" This scheme was created by CSApproxSnapshot
" on Wed, 12 Nov 2014

hi clear
if exists("syntax_on")
    syntax reset
endif

if v:version < 700
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" substitute(substitute(<q-args>, "undercurl", "underline", "g"), "guisp\\S\\+", "", "g")
else
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" <q-args>
endif

function! s:old_kde()
  " Konsole only used its own palette up til KDE 4.2.0
  if executable('kde4-config') && system('kde4-config --kde-version') =~ '^4.[10].'
    return 1
  elseif executable('kde-config') && system('kde-config --version') =~# 'KDE: 3.'
    return 1
  else
    return 0
  endif
endfunction

if 0
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_konsole") && g:CSApprox_konsole) || (&term =~? "^konsole" && s:old_kde())
    CSAHi Normal term=NONE cterm=NONE ctermbg=Black ctermfg=188 gui=NONE guibg=#202020 guifg=#cccccc
    CSAHi pythonSpaceError term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=194 gui=NONE guibg=bg guifg=#ccffcc
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#aaccff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#cccccc
    CSAHi Underlined term=underline cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#cccccc
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#202020
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=159 gui=NONE guibg=#ffff00 guifg=#92faff
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#aadddd
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#cccccc
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=149 gui=NONE guibg=bg guifg=#9acd32
    CSAHi NonText term=bold cterm=NONE ctermbg=234 ctermfg=145 gui=NONE guibg=#202020 guifg=#999999
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#aac7f8
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#999999
    CSAHi pythonSync term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaDocSeeTag term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyRegexp term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyRegexpDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyEscape term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyInterpolationDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyControl term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyStringDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
    CSAHi Pmenu term=NONE cterm=bold ctermbg=201 ctermfg=fg gui=bold guibg=#ff00ff guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=248 ctermfg=fg gui=NONE guibg=#a9a9a9 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=#bebebe guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=248 ctermfg=fg gui=underline guibg=#a9a9a9 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=102 ctermfg=fg gui=NONE guibg=#666666 guifg=fg
    CSAHi CommandTCharMatched term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CommandTCharMatchedEnd term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=194 gui=NONE guibg=bg guifg=#ccffcc
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=#00ff00
    CSAHi StatusLine term=bold,reverse cterm=NONE ctermbg=238 ctermfg=188 gui=NONE guibg=#444444 guifg=#cccccc
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=188 gui=NONE guibg=#444444 guifg=#cccccc
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#444444 guifg=#7777777
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=188 gui=bold guibg=bg guifg=#cccccc
    CSAHi Visual term=reverse cterm=NONE ctermbg=240 ctermfg=183 gui=NONE guibg=#555555 guifg=#ccaaff
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi CursorLine term=underline cterm=NONE ctermbg=236 ctermfg=231 gui=NONE guibg=#303030 guifg=#ffffff
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=238 ctermfg=231 gui=NONE guibg=#444444 guifg=#ffffff
    CSAHi Cursor term=NONE cterm=NONE ctermbg=37 ctermfg=238 gui=NONE guibg=#13879c guifg=#444444
    CSAHi lCursor term=NONE cterm=NONE ctermbg=188 ctermfg=234 gui=NONE guibg=#cccccc guifg=#202020
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=240 ctermfg=183 gui=NONE guibg=#555555 guifg=#ccaaff
    CSAHi Comment term=bold cterm=bold ctermbg=bg ctermfg=245 gui=bold guibg=bg guifg=#888888
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#aadddd
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#fffefc
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=194 gui=NONE guibg=bg guifg=#ccffcc
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#aaccff
    CSAHi Folded term=NONE cterm=NONE ctermbg=238 ctermfg=153 gui=NONE guibg=#444444 guifg=#aaccff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=19 ctermfg=fg gui=NONE guibg=#00008b guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=127 ctermfg=fg gui=NONE guibg=#8b008b guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=37 ctermfg=21 gui=bold guibg=#008b8b guifg=#0000ff
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=#ff0000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=Black ctermfg=252 gui=NONE guibg=#202020 guifg=#cccccc
    CSAHi pythonSpaceError term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ccffcc
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#aaccff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#cccccc
    CSAHi Underlined term=underline cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#cccccc
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#202020
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=159 gui=NONE guibg=#ffff00 guifg=#92faff
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#aadddd
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#cccccc
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#9acd32
    CSAHi NonText term=bold cterm=NONE ctermbg=234 ctermfg=246 gui=NONE guibg=#202020 guifg=#999999
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#aac7f8
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=246 gui=NONE guibg=bg guifg=#999999
    CSAHi pythonSync term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaDocSeeTag term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyRegexp term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyRegexpDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyEscape term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyInterpolationDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyControl term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyStringDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
    CSAHi Pmenu term=NONE cterm=bold ctermbg=gray ctermfg=fg gui=bold guibg=#ff00ff guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=248 ctermfg=fg gui=NONE guibg=#a9a9a9 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=#bebebe guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=248 ctermfg=fg gui=underline guibg=#a9a9a9 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=241 ctermfg=fg gui=NONE guibg=#666666 guifg=fg
    CSAHi CommandTCharMatched term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CommandTCharMatchedEnd term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ccffcc
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=#00ff00
    CSAHi StatusLine term=bold,reverse cterm=NONE ctermbg=238 ctermfg=252 gui=NONE guibg=#444444 guifg=#cccccc
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=252 gui=NONE guibg=#444444 guifg=#cccccc
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#444444 guifg=#7777777
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=252 gui=bold guibg=bg guifg=#cccccc
    CSAHi Visual term=reverse cterm=NONE ctermbg=102 ctermfg=225 gui=NONE guibg=#555555 guifg=#ccaaff
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi CursorLine term=underline cterm=NONE ctermbg=236 ctermfg=255 gui=NONE guibg=#303030 guifg=#ffffff
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=238 ctermfg=255 gui=NONE guibg=#444444 guifg=#ffffff
    CSAHi Cursor term=NONE cterm=NONE ctermbg=38 ctermfg=238 gui=NONE guibg=#13879c guifg=#444444
    CSAHi lCursor term=NONE cterm=NONE ctermbg=252 ctermfg=234 gui=NONE guibg=#cccccc guifg=#202020
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=102 ctermfg=225 gui=NONE guibg=#555555 guifg=#ccaaff
    CSAHi Comment term=bold cterm=bold ctermbg=bg ctermfg=245 gui=bold guibg=bg guifg=#888888
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#aadddd
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#fffefc
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ccffcc
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#aaccff
    CSAHi Folded term=NONE cterm=NONE ctermbg=238 ctermfg=195 gui=NONE guibg=#444444 guifg=#aaccff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=19 ctermfg=fg gui=NONE guibg=#00008b guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=127 ctermfg=fg gui=NONE guibg=#8b008b guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=37 ctermfg=21 gui=bold guibg=#008b8b guifg=#0000ff
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=#ff0000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=231 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=Black ctermfg=252 gui=NONE guibg=#202020 guifg=#cccccc
    CSAHi pythonSpaceError term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=194 gui=NONE guibg=bg guifg=#ccffcc
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#aaccff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#cccccc
    CSAHi Underlined term=underline cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#cccccc
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#202020
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=123 gui=NONE guibg=#ffff00 guifg=#92faff
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#aadddd
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#cccccc
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=113 gui=NONE guibg=bg guifg=#9acd32
    CSAHi NonText term=bold cterm=NONE ctermbg=234 ctermfg=246 gui=NONE guibg=#202020 guifg=#999999
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#aac7f8
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=246 gui=NONE guibg=bg guifg=#999999
    CSAHi pythonSync term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaDocSeeTag term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyRegexp term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyRegexpDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyEscape term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyInterpolationDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyControl term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyStringDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
    CSAHi Pmenu term=NONE cterm=bold ctermbg=238 ctermfg=fg gui=bold guibg=#ff00ff guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=248 ctermfg=fg gui=NONE guibg=#a9a9a9 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=#bebebe guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=248 ctermfg=fg gui=underline guibg=#a9a9a9 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=241 ctermfg=fg gui=NONE guibg=#666666 guifg=fg
    CSAHi CommandTCharMatched term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CommandTCharMatchedEnd term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#ccffcc
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=#00ff00
    CSAHi StatusLine term=bold,reverse cterm=NONE ctermbg=238 ctermfg=252 gui=NONE guibg=#444444 guifg=#cccccc
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=252 gui=NONE guibg=#444444 guifg=#cccccc
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#444444 guifg=#7777777
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=252 gui=bold guibg=bg guifg=#cccccc
    CSAHi Visual term=reverse cterm=NONE ctermbg=240 ctermfg=183 gui=NONE guibg=#555555 guifg=#ccaaff
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi CursorLine term=underline cterm=NONE ctermbg=236 ctermfg=231 gui=NONE guibg=#303030 guifg=#ffffff
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=238 ctermfg=231 gui=NONE guibg=#444444 guifg=#ffffff
    CSAHi Cursor term=NONE cterm=NONE ctermbg=31 ctermfg=238 gui=NONE guibg=#13879c guifg=#444444
    CSAHi lCursor term=NONE cterm=NONE ctermbg=252 ctermfg=234 gui=NONE guibg=#cccccc guifg=#202020
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=240 ctermfg=183 gui=NONE guibg=#555555 guifg=#ccaaff
    CSAHi Comment term=bold cterm=bold ctermbg=bg ctermfg=102 gui=bold guibg=bg guifg=#888888
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#aadddd
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#fffefc
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=194 gui=NONE guibg=bg guifg=#ccffcc
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#aaccff
    CSAHi Folded term=NONE cterm=NONE ctermbg=238 ctermfg=153 gui=NONE guibg=#444444 guifg=#aaccff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=18 ctermfg=fg gui=NONE guibg=#00008b guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=90 ctermfg=fg gui=NONE guibg=#8b008b guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=30 ctermfg=21 gui=bold guibg=#008b8b guifg=#0000ff
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=#ff0000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#202020 guifg=#cccccc
    CSAHi pythonSpaceError term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=62 gui=NONE guibg=bg guifg=#ccffcc
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#aaccff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#cccccc
    CSAHi Underlined term=underline cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#cccccc
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#202020
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=76 ctermfg=47 gui=NONE guibg=#ffff00 guifg=#92faff
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=42 gui=NONE guibg=bg guifg=#aadddd
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#cccccc
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=#9acd32
    CSAHi NonText term=bold cterm=NONE ctermbg=80 ctermfg=84 gui=NONE guibg=#202020 guifg=#999999
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#aac7f8
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=84 gui=NONE guibg=bg guifg=#999999
    CSAHi pythonSync term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaDocSeeTag term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyRegexp term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyRegexpDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyEscape term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyInterpolationDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyControl term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi rubyStringDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=31 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
    CSAHi Pmenu term=NONE cterm=bold ctermbg=67 ctermfg=fg gui=bold guibg=#ff00ff guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=84 ctermfg=fg gui=NONE guibg=#a9a9a9 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=#bebebe guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=79 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=84 ctermfg=fg gui=underline guibg=#a9a9a9 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=81 ctermfg=fg gui=NONE guibg=#666666 guifg=fg
    CSAHi CommandTCharMatched term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CommandTCharMatchedEnd term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=62 gui=NONE guibg=bg guifg=#ccffcc
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=76 gui=bold guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=#00ff00
    CSAHi StatusLine term=bold,reverse cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#444444 guifg=#cccccc
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#444444 guifg=#cccccc
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#444444 guifg=#7777777
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=58 gui=bold guibg=bg guifg=#cccccc
    CSAHi Visual term=reverse cterm=NONE ctermbg=81 ctermfg=55 gui=NONE guibg=#555555 guifg=#ccaaff
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi CursorLine term=underline cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=#303030 guifg=#ffffff
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=#444444 guifg=#ffffff
    CSAHi Cursor term=NONE cterm=NONE ctermbg=21 ctermfg=80 gui=NONE guibg=#13879c guifg=#444444
    CSAHi lCursor term=NONE cterm=NONE ctermbg=58 ctermfg=80 gui=NONE guibg=#cccccc guifg=#202020
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=81 ctermfg=55 gui=NONE guibg=#555555 guifg=#ccaaff
    CSAHi Comment term=bold cterm=bold ctermbg=bg ctermfg=83 gui=bold guibg=bg guifg=#888888
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=42 gui=NONE guibg=bg guifg=#aadddd
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#fffefc
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=62 gui=NONE guibg=bg guifg=#ccffcc
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#aaccff
    CSAHi Folded term=NONE cterm=NONE ctermbg=80 ctermfg=43 gui=NONE guibg=#444444 guifg=#aaccff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=31 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#00008b guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=33 ctermfg=fg gui=NONE guibg=#8b008b guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=21 ctermfg=19 gui=bold guibg=#008b8b guifg=#0000ff
    CSAHi DiffText term=reverse cterm=bold ctermbg=64 ctermfg=fg gui=bold guibg=#ff0000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=31 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi Conceal term=NONE cterm=NONE ctermbg=84 ctermfg=86 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi Pmenu term=NONE cterm=bold ctermbg=238 ctermfg=fg gui=bold guibg=#ff00ff guifg=fg
endif

if 1
    delcommand CSAHi
endif
