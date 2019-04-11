scriptencoding utf-8

autocmd MyAutoCmd BufWritePre * call functions#mkdirifnotexist()
