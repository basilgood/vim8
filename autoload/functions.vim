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

function! functions#mystatusline(mode)
  let statusline=''

  if a:mode ==# 'Enter'
    let statusline.='%2* %n '
    let statusline.='%1*⏵ '
    let statusline.='%4*%{pathshorten(expand("%:~:."))}'
    let statusline.=' %h%r'
    let statusline.=' %1*%{exists("g:loaded_fugitive")?"⏶ ".fugitive#head():""}'
    let statusline.=' %3*%{&mod?" + ":""}%1*'
    let statusline.='%='
    let statusline.=' %1*%{&filetype!=#""?&filetype:"none"}'
    let statusline.=' %2*%12(%c:%l/%L%)%1* ⏴ '
    let statusline.=' %*'
  endif

  if a:mode ==# 'Leave'
    let statusline.='%5*%n '
    let statusline.='%5*%t'
    let statusline.='%='
    let statusline.='%{&filetype!=#""?&filetype:"none"} '
  endif

  return statusline
endfunction
