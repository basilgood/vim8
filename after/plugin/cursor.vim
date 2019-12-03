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
