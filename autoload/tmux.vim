scriptencoding utf-8

if exists('$TMUX')
  let &t_ti .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
  let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
  let &t_SR .= "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
  let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
  let &t_te .= "\<Esc>Ptmux;\<Esc>\<Esc>[0 q\<Esc>\\"
else
  let &t_ti.="\e[2 q"
  let &t_SI.="\e[6 q"
  let &t_SR.="\e[4 q"
  let &t_EI.="\e[2 q"
  let &t_te.="\e[0 q"
endif

if has('termguicolors')
  if &term =~# 'tmux-256color'
    let &t_8f="\e[38;2;%ld;%ld;%ldm"
    let &t_8b="\e[48;2;%ld;%ld;%ldm"
  endif
endif

if !has('nvim')
  if &term =~# 'tmux-256color'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
  endif
endif

" bracketed paste mode work inside tmux:
if $TERM =~# '^\%(tmux\|screen\)'
  set ttymouse=xterm2
  let &t_BE = "\033[?2004h"
  let &t_BD = "\033[?2004l"
  let &t_PS = "\033[200~"
  let &t_PE = "\033[201~"
endif

function! tmux#tmux() abort
endfunction
