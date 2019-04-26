scriptencoding utf-8

function functions#mkdirifnotexist()
  let dir = expand('%:p:h')
  if dir =~# '://'
    return
  endif
  if !isdirectory(dir)
    call mkdir(dir, 'p')
    echo 'Created non-existing directory: '.dir
  endif
endfunction

function! functions#getfilesize() abort
  if &encoding ==# &fileencoding || &fileencoding ==# ''
    let size = line2byte(line('$') + 1) - 1
    if !&endofline
      let size -= 1
    endif
  else
    let size = getfsize(expand('%'))
  endif

  if size < 0
    let size = 0
  endif
  for unit in ['B', 'KB', 'MB']
    if size < 1024
      return size . unit
    endif
    let size = size / 1024
  endfor
  return size . 'GB'
endfunction

fun! SearchHighlight()
  silent! call matchdelete(b:ring)
  let b:ring = matchadd('IncSearch', '\c\%#' . @/, 101)
endfun

fun! functions#searchnext()
  try
    execute 'normal! ' . 'Nn'[v:searchforward]
  catch /E385:/
    echohl IncSearch | echo 'E385: search hit BOTTOM without match for: ' . @/ | echohl None
  endtry
  call SearchHighlight()
endfun

fun! functions#searchprevious()
  try
    execute 'normal! ' . 'nN'[v:searchforward]
  catch /E384:/
    echohl IncSearch | echo 'E384: search hit TOP without match for: ' . @/ | echohl None
  endtry
  call SearchHighlight()
endfun

function! functions#hl()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction
