scriptencoding utf-8

set shell=/usr/bin/env\ bash

if exists('$TMUX')
  let &t_ti.="\eP\e[1 q\e\\"
  let &t_SI.="\eP\e[5 q\e\\"
  let &t_SR.="\eP\e[3 q\e\\"
  let &t_EI.="\eP\e[1 q\e\\"
  let &t_te.="\eP\e[0 q\e\\"
else
  let &t_ti.="\<Esc>[1 q"
  let &t_SI.="\<Esc>[5 q"
  let &t_SR.="\<Esc>[3 q"
  let &t_EI.="\<Esc>[1 q"
  let &t_te.="\<Esc>[0 q"
endif

if has('termguicolors')
  if &term =~# 'tmux-256color'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
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

function! unix#unix() abort
endfunction
