scriptencoding utf-8

function! s:vgrep(args)
  let l:grep_command = 'grep --exclude-dir={.git,tag,node_modules,pack} -nHRI'
  let expr = l:grep_command.' '.a:args
  cgetexpr system(expr)
  cwindow
  let @/=a:args
  setlocal hlsearch
  echo 'Number of matches: ' . len(getqflist())
endfunction

command! -nargs=+ Ack :call s:vgrep(<q-args>)
