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

function! cursorshape#cursor() abort
endfunction
