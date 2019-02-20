scriptencoding utf-8

function! MakeSession()
  let b:sessiondir = $CACHE . '/sessions' . getcwd()
  if (filewritable(b:sessiondir) != 2)
    call mkdir(b:sessiondir,'p')
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe 'mksession! ' . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $CACHE . '/sessions' . getcwd()
  let b:sessionfile = b:sessiondir . '/session.vim'
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo 'No session loaded.'
  endif
endfunction
command! -nargs=0 SS call LoadSession()
cabbrev ss SS

autocmd MyAutoCmd VimLeave * :call MakeSession()
