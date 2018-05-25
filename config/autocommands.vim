AutoCmd FocusGained,BufEnter,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | silent! checktime | endif
AutoCmd BufEnter * syntax sync minlines=99999
AutoCmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal! g`"zz' | endif
AutoCmd CmdLineEnter * packadd cmdline-completion
AutoCmd BufWritePre * call mkdir#Easy()
" AutoCmd QuickfixCmdPost [^l]* nested copen | wincmd p
" AutoCmd QuickfixCmdPost l* nested lopen | wincmd p
AutoCmd BufEnter * call timer_start(100, function('pack_delayed#plugins'))

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
