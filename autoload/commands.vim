scriptencoding utf-8

command!-nargs=0 BO silent! execute "%bd|e#|bd#"
command! Bd setlocal bufhidden=delete | bnext
command!-range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
command!-range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'
command!-nargs=0 WS %s/\s\+$// | normal! ``
command!-nargs=0 HL call functions#hl()
command!-nargs=+ -complete=file Ack :call grep#vgrep(<q-args>)
command!-nargs=+ -complete=file Grp execute 'silent Ggrep! --untracked' <q-args> | cwindow | redraw!
command! SC vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
command! -nargs=+ -complete=shellcmd B AsyncRun! <args>
command! -nargs=? -bang -complete=dir FF
      \ call fzf#vim#files(<q-args>, <bang>0 ? fzf#vim#with_preview('up:90%') : {}, <bang>0)

function! commands#commands()
endfunction
