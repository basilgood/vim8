scriptencoding utf-8

command -nargs=0 BO silent! execute "%bd|e#|bd#"
command -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
command -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'
command -nargs=0 WS %s/\s\+$// | normal! ``
command -nargs=0 HL call functions#hl()
command -nargs=+ -complete=file Ack :call grep#vgrep(<q-args>)
command -nargs=+ -complete=file Grp execute 'silent Ggrep! --untracked' <q-args> | cwindow | redraw!

command! -nargs=1 TX
  \ call system('tmux split-window -d -l 16 '.<q-args>)
command! GP TX git push
command! GPF TX git push --force

" Execute a Vim command and send the output to a new scratch buffer
command! -complete=command -nargs=+ VimCmd call lf_run#vim_cmd(<q-args>)

" Open a terminal and "bind" it to the current buffer (see \x mappings below)
command! BindTerminal call lf_terminal#open()

function! commands#commands()
endfunction
