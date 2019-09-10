scriptencoding utf-8

function! sessions#make() abort
  let b:sessiondir = $CACHE . '/sessions' . getcwd()
  if (filewritable(b:sessiondir) != 2)
    call mkdir(b:sessiondir,'p')
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe 'mksession! ' . b:filename
endfunction

function! sessions#load() abort
  let b:sessiondir = $CACHE . '/sessions' . getcwd()
  let b:sessionfile = b:sessiondir . '/session.vim'
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo 'No session loaded.'
  endif
endfunction
