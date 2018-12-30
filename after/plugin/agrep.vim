if !exists('s:agrep_cmd')
  autocmd BufWinEnter Agrep setlocal nornu | setlocal nowrap
  let s:agrep_cmd = 1
endif

let g:agrep_default_flags = '-I --exclude-dir=.{git,svn,tags} --exclude={tags,yarn.lock}'
map <Leader>] :<C-U>exe v:count1.(bufwinnr('Agrep') == -1 ? 'cn' : 'Anext')<CR>
map <Leader>[ :<C-U>exe v:count1.(bufwinnr('Agrep') == -1 ? 'cp' : 'Aprev')<CR>
map ]n :<C-U>exe v:count1.(bufwinnr('Agrep') == -1 ? 'cn' : 'Anfile')<CR>
map [n :<C-U>exe v:count1.(bufwinnr('Agrep') == -1 ? 'cp' : 'Apfile')<CR>
