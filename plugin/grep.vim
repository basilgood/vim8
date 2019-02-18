scriptencoding utf-8

function! s:vgrep(args)
  let l:grep_command = 'grep --exclude-dir={.git,tag} -nHRI'
  let expr = l:grep_command.' '.a:args
  cgetexpr system(expr)
  cwindow
  let @/=a:args
  setlocal hlsearch
  echo 'Number of matches: ' . len(getqflist())
endfunction

command! -nargs=+ VG :call s:vgrep(<q-args>)