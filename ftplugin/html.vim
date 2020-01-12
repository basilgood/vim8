scriptencoding utf-8

setlocal includeexpr=substitute(v:fname,'^\\/','','')
setlocal path+=./;/

" autocmd vimRc BufWrite * Autoformat
