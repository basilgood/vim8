scriptencoding utf-8

function! functions#plug(plug_load) abort
  exec 'packadd'.' '.a:plug_load
endfunction

function! functions#bgrep(args) abort
  let &errorformat = 'l'
  let l:bgrep_command = 'vimgrep'
  let expr = l:bgrep_command.' '.'/'.a:args.'/'.'j %'
  execute expr
  cwindow
  let @/=a:args
  setlocal hlsearch
  echom 'Number of matches: ' . len(getqflist())
endfunction

function! functions#vgrep(args) abort
  let l:grep_command = 'grep --exclude-dir={.git,tag,node_modules,pack} -nHRI'
  let expr = l:grep_command.' '.a:args
  cgetexpr system(expr)
  cwindow
  let @/=a:args
  setlocal hlsearch
  echo 'Number of matches: ' . len(getqflist())
endfunction

function! functions#inlinepaste(p)
  let l:original_reg = getreg(v:register)
  let l:stripped_reg = substitute(l:original_reg, '\v^%(\n|\s)*(.{-})%(\n|\s)*$', '\1', '')
  call setreg(v:register, l:stripped_reg, 'c')
  exe 'normal "' . v:register . a:p
  call setreg(v:register, l:original_reg)
endfunction

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

