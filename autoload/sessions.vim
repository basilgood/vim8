scriptencoding utf-8

function! s:MakeSession()
  let b:sessiondir = $CACHE . '/sessions' . getcwd()
  if (filewritable(b:sessiondir) != 2)
    call mkdir(b:sessiondir,'p')
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe 'mksession! ' . b:filename
endfunction

function! s:LoadSession()
  let b:sessiondir = $CACHE . '/sessions' . getcwd()
  let b:sessionfile = b:sessiondir . '/session.vim'
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo 'No session loaded.'
  endif
endfunction
command! -nargs=0 SS call s:LoadSession()
cabbrev ss SS

autocmd MyAutoCmd VimLeavePre * call s:MakeSession()

function! sessions#sessions() abort
endfunction
