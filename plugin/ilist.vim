function! s:ilist_qf(start_at_cursor)
  redir => output
    silent! exec 'normal! '.(a:start_at_cursor ? ']' : '[').'I'
  redir END
  let lines = split(output, '\n')
  if lines[0] =~# '^Error detected'
    echomsg 'Could not find the word in file'
    return
  endif
  let [filename, line_info] = [lines[0], lines[1:-1]]
  "turn the :ilist output into a quickfix dictionary
  let qf_entries = map(line_info, "{
        \ 'filename': filename,
        \ 'lnum': split(v:val)[1],
        \ 'text': getline(split(v:val)[1])
        \ }")
  call setqflist(qf_entries)
  cwindow
endfunction
noremap <silent> [I :call <sid>ilist_qf(0)<CR>
noremap <silent> ]I :call <sid>ilist_qf(1)<CR>
