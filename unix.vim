scriptencoding utf-8

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

" bracketed paste
if &term =~ '^tmux'
  let &t_BE="\<Esc>[?2004h"
  let &t_BD="\<Esc>[?2004l"
  let &t_PS="\<Esc>[200~"
  let &t_PE="\<Esc>[201~"
endif

" Enhance performance of scroll in vsplit mode via DECSLRM
if has('vim_starting') && !has('gui_running') && !has('nvim')
  " Enable origin mode and left/right margins
  function! s:enable_vsplit_mode() abort
    let &t_CS = 'y'
    let &t_ti = &t_ti . "\e[?6;69h"
    let &t_te = "\e[?6;69l\e[999H" . &t_te
    let &t_CV = "\e[%i%p1%d;%p2%ds"
    call writefile(["\e[?6;69h"], '/dev/tty', 'a')
  endfunction

  " Old vim does not ignore CPR
  map <special> <Esc>[3;9R <Nop>

  " New vim can't handle CPR with direct mapping
  " map <expr> ^[[3;3R <SID>enable_vsplit_mode()
  set t_F9=[3;3R
  map <expr> <t_F9> <SID>enable_vsplit_mode()
  let &t_RV .= "\e[?6;69h\e[1;3s\e[3;9H\e[6n\e[0;0s\e[?6;69l"
endif
