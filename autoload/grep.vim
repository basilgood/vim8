scriptencoding utf-8

function! grep#vgrep(args) abort
  let l:grep_command = 'ag --smart-case --vimgrep'
  " let l:grep_command = 'grep --exclude-dir={.git,tag,node_modules,pack} -nHRI'
  let expr = l:grep_command.' '.a:args
  cgetexpr system(expr)
  cwindow
  let @/=a:args
  setlocal hlsearch
  echo 'Number of matches: ' . len(getqflist())
endfunction

function! grep#dgrep(cmd, args)
  let g:grepprg='grep --exclude-dir={.git,tag,node_modules,pack} -nHRI'
  let @/ = a:args
  setlocal hlsearch
  let l:makeprg_bak = &l:makeprg
  let l:errorformat_bak = &l:errorformat

  try
    let &l:makeprg = g:grepprg . ' ' . a:args
    let &l:errorformat = '%f:%l:%c:%m,%f:%l:%m'

    Make
  finally
    let &l:makeprg = l:makeprg_bak
    let &l:errorformat = l:errorformat_bak
  endtry
endfunction
