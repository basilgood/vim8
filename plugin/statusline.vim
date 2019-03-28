scriptencoding utf-8

highlight User1 ctermbg=236 guibg=#071423 ctermfg=10  guifg=#00a045 gui=NONE | " green
highlight User2 ctermbg=236 guibg=#071423 ctermfg=4   guifg=#3e819b gui=NONE | " blue
highlight User3 ctermbg=9   guibg=#ff2c4b ctermfg=196 guifg=#d9cec3 gui=NONE | " red
highlight User4 ctermbg=236 guibg=#071423 ctermfg=251 guifg=#c5c5c5 gui=NONE | " white
highlight User5 ctermbg=236 guibg=#0f3851 ctermfg=251 guifg=#111111 gui=NONE | " white

function! MyStatusLine(mode)
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

autocmd MyAutoCmd WinEnter * setlocal statusline=%!MyStatusLine('Enter')
autocmd MyAutoCmd WinLeave * setlocal statusline=%!MyStatusLine('Leave')
set statusline=%!MyStatusLine('Enter')
