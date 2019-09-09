scriptencoding utf-8

command! -nargs=0 BO silent! execute "%bd|e#|bd#"
command! Bd setlocal bufhidden=delete | bnext
command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'
command! -nargs=0 WS %s/\s\+$// | normal! ``
command! -nargs=0 HL call functions#hl()
command! -nargs=* -complete=file Grep call grep#dgrep('grep<bang>',<q-args>)
command! SC vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
command! -range GB echo join(systemlist("git blame -L <line1>,<line2> " . expand('%')), "\n")
command! CmdHist call fzf#vim#command_history({'right': '40'})
command! OpenChangedFiles :call functions#changedfiles()
command! PackInstall call dein#install()
command! PackCheck echo dein#check_clean()
command! PackDelete call map(dein#check_clean(), "delete(v:val, 'rf')")

function! commands#commands() abort
endfunction
