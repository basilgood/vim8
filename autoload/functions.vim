scriptencoding utf-8

function! functions#mkdirifnotexist()
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

" lifepillar
function! functions#large_file(name)
  let b:large_file = 1
  syntax clear
  set eventignore+=FileType
  let &backupskip .= ',' . a:name
  setlocal foldmethod=manual nofoldenable noswapfile noundofile norelativenumber
  augroup large_buffer
    autocmd!
    autocmd BufWinEnter <buffer> call <sid>restore_eventignore()
  augroup END
endf

function! s:restore_eventignore()
  set eventignore-=FileType
  autocmd! large_buffer
  augroup! large_buffer
endf

function! functions#hl()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction

function! functions#mkdir(dir)
  if !isdirectory(a:dir)
    call mkdir(a:dir, 'p')
  endif
endfunction

function! functions#get_selected_text()
  let tmp = @"
  normal! gvy
  normal! gv
  let [tmp, @"] = [@", tmp]
  return tmp
endfunc

function! functions#plain_text_pattern(s)
  return substitute(substitute('\V'.escape(a:s, '\'), '\n', '\\n', 'g'), '\t', '\\t', 'g')
endfunc

function! functions#get_search_pat()
  return functions#plain_text_pattern(functions#get_selected_text())
endfunc
