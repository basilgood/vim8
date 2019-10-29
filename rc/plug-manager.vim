scriptencoding utf-8

function! s:has_plugin(name)
  return globpath(&runtimepath, 'plugin/' . a:name . '.vim') !=# ''
        \ || globpath(&runtimepath, 'autoload/' . a:name . '.vim') !=# ''
endfunction

function! s:mkdir_if_not_exists(path)
  if !isdirectory(a:path)
    call mkdir(a:path, 'p')
  endif
endfunction

function! s:create_helptags(path)
  if isdirectory(a:path)
    execute 'helptags ' . a:path
  endif
endfunction

function! InstallPackPlugins()
  for key in keys(g:plugins)
    let dir = expand($PACKPATH . '/' . key)
    call s:mkdir_if_not_exists(dir)

    for url in g:plugins[key]
      let dst = expand(dir . '/' . split(url, '/')[-1])
      if isdirectory(dst)
        " plugin is already installed
        continue
      endif

      echo 'installing: ' . dst
      let cmd = printf('git clone --recursive %s %s', url, dst)
      call system(cmd)
      call s:create_helptags(expand(dst . '/doc/'))
    endfor
  endfor
endfunction

function! UpdateHelpTags()
  for key in keys(g:plugins)
    let dir = expand($PACKPATH . '/' . key)

    for url in g:plugins[key]
      let dst = expand(dir . '/' . split(url, '/')[-1])
      if !isdirectory(dst)
        " plugin is not installed
        continue
      endif

      echomsg 'helptags: ' . dst
      call s:create_helptags(expand(dst . '/doc/'))
    endfor
  endfor
endfunction

function! UpdatePackPlugins()
  topleft split
  edit `='[update plugins]'`
  setlocal buftype=nofile

  let s:pidx = 0
  call timer_start(100, 'PluginUpdateHandler', {'repeat': len(g:plugins.opt)})
endfunction

function! PluginUpdateHandler(timer)
  let dir = expand($PACKPATH . '/' . 'opt')
  let url = g:plugins.opt[s:pidx]
  let dst = expand(dir . '/' . split(url, '/')[-1])

  let cmd = printf('git -C %s pull --ff --ff-only', dst)
  call job_start(cmd, {'out_io': 'buffer', 'out_name': '[update plugins]'})

  let s:pidx += 1
  if s:pidx == len(g:plugins.opt)
    call UpdateHelpTags()
  endif
endfunction

let s:pidx = 0
function! PackAddHandler(timer)
  let plugin_name = split(g:plugins.opt[s:pidx], '/')[-1]

  let plugin_path = expand($PACKPATH . '/opt/' . plugin_name)
  if isdirectory(plugin_path)
    execute 'packadd ' . plugin_name
  endif

  let s:pidx += 1
  if s:pidx == len(g:plugins.opt)
    doautocmd fugitive BufReadPost
    doautocmd signify BufReadPost
    " autocmd! BufWritePost,BufEnter * Neomake
    call SubMode()
    call neomake#configure#automake('nrwi', 500)
  endif
endfunction

if has('vim_starting') && has('timers')
  autocmd vimRc VimEnter * call timer_start(1, 'PackAddHandler', {'repeat': len(g:plugins.opt)})
endif
