scriptencoding utf-8

function! s:bgrep(args)
  let &errorformat = 'l'
  let l:bgrep_command = 'vimgrep'
  let expr = l:bgrep_command.' '.'/'.a:args.'/'.'j %'
  execute expr
  cwindow
  let @/=a:args
  setlocal hlsearch
  echom 'Number of matches: ' . len(getqflist())
endfunction

command! -nargs=+ Bck :call s:bgrep(<q-args>)
nnoremap <M-b> :Bck<space>
