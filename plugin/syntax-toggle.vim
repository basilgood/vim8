scriptencoding utf-8

function! ToggleSyntax()
  if exists('g:syntax_on')
    syntax off
  else
    syntax enable
  endif
endfunction

nnoremap <silent> ;s :call ToggleSyntax()<cr>
