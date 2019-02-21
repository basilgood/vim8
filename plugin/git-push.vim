scriptencoding utf-8

command! -nargs=1 TX
  \ call system('tmux split-window -d -l 10 '.<q-args>)
cnoremap !! TX<space>
command! GP TX git push
