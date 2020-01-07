scriptencoding utf-8

command! -nargs=0 BO silent! execute "%bd|e#|bd#"
command! BD setlocal bufhidden=delete | bnext
command! -nargs=0 WS %s/\s\+$// | normal! ``
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
command! -nargs=0 Nixfmt Dispatch! nixfmt %
command! -bang -nargs=* -complete=file Grep call functions#grep('grep<bang>',<q-args>)
command! HL call functions#hl()
command! -bang -nargs=* -complete=file Make call asyncdo#run(<bang>0, &makeprg, <f-args>)
command! -bang -nargs=* -complete=dir Grp call asyncdo#run(<bang>0,
            \ { 'job': &grepprg, 'errorformat': &grepformat },
            \ <f-args>)
