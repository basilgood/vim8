scriptencoding utf-8

let b:ale_fixers = ['eslint']
setlocal includeexpr=substitute(v:fname,'^\\/','','')
setlocal path+=./;/
