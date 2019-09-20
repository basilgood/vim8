scriptencoding utf-8

" use packager: yukimemi.
set packpath^=$CACHE_HOME
let s:packager_dir = $CACHE_HOME . '/pack/packager/opt/vim-packager'
let s:packager_download = 0
if has('vim_starting')
  if !isdirectory(s:packager_dir)
    echo 'Install vim-packager ...'
    execute '!git clone --depth 1 https://github.com/kristijanhusak/vim-packager ' . s:packager_dir
    let s:packager_download = 1
  endif
endif

" packager init.
let s:packager_init = 0
let s:plugins = []
function! PackagerInit() abort
  packadd vim-packager

  for plugin in s:plugins
    call packager#add(plugin[0], plugin[1])
  endfor
endfunction

" packager helper function.
let s:lazy_plugs = []
function! s:packager_add(repo, ...) abort
  let l:opts = get(a:000, 0, {})
  if has_key(l:opts, 'if')
    if ! l:opts.if
      return
    endif
  endif

  let l:name = substitute(a:repo, '^.*/', '', '')

  " packadd on filetype.
  if has_key(l:opts, 'ft')
    let l:ft = type(l:opts.ft) == type([]) ? join(l:opts.ft, ',') : l:opts.ft
    exe printf('au vimRc FileType %s packadd %s', l:ft, l:name)
  endif

  " packadd on cmd.
  if has_key(l:opts, 'cmd')
    let l:cmd = type(l:opts.cmd) == type([]) ? join(l:opts.cmd, ',') : l:opts.cmd
    exe printf('au vimRc CmdUndefined %s packadd %s', l:cmd, l:name)
  endif

  " lazy load.
  if has_key(l:opts, 'lazy')
    if l:opts.lazy
      call add(s:lazy_plugs, l:name)
    endif
  endif

  call add(s:plugins, [a:repo, l:opts])
endfunction

com! -nargs=+ Pac call <SID>packager_add(<args>)

" load lazy plugins.
let s:idx = 0
function! PackAddHandler(timer)
  exe 'packadd ' . s:lazy_plugs[s:idx]
  let s:idx += 1
  " doautocmd BufReadPost
  au! lazy_load_bundle
endfunction

aug lazy_load_bundle
  au vimRc VimEnter * call timer_start(0, 'PackAddHandler', {'repeat': len(s:lazy_plugs)})
aug END

com! PackagerInstall call PackagerInit() | call packager#install()
com! PackagerUpdate call PackagerInit() | call packager#update()
com! PackagerClean call PackagerInit() | call packager#clean()
com! PackagerStatus call PackagerInit() | call packager#status()
