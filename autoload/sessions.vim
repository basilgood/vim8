scriptencoding utf-8

let g:session_dir = $CACHE.'/sessions'

function! sessions#make() abort
  let s = v:servername
  if !isdirectory(g:session_dir)
    call mkdir(g:session_dir, 'p')
  endif
  execute 'mksession! '.g:session_dir.'/'.s.'.session.vim'
endfunc

function! sessions#load() abort
  if argc() == 0
    let sn = v:servername
    let file = g:session_dir.'/'.sn.'.session.vim'
    if filereadable(file)
      execute 'source '.file
    endif
  endif
endfunc
