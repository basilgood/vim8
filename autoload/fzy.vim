scriptencoding utf-8

function! fzy#find(choice_command, vim_command) abort
  try
    let output = system(a:choice_command . ' | fzy ')
  catch /Vim:Interrupt/
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

" command! -nargs=0 Fzy call s:fzyFind("fd --type f --hidden --exclude '.git' .", ":e")
" nnoremap <c-p> :Fzy<cr>
