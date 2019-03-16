scriptencoding utf-8

function! s:find_node_executable(cmd)
  let l:cwd = expand('%:p:h')
  let l:rp = fnamemodify('/', ':p')
  let l:hp = fnamemodify('~/', ':p')
  while l:cwd != l:hp && l:cwd != l:rp
    if filereadable(resolve(l:cwd . '/package.json'))
      let l:execPath = fnamemodify(l:cwd . '/node_modules/.bin/' . a:cmd, ':p')
      if executable(l:execPath)
        return l:execPath
      endif
    endif
    let l:cwd = resolve(l:cwd . '/..')
  endwhile
  return ''
endfunction
