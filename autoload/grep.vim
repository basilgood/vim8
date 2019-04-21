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
