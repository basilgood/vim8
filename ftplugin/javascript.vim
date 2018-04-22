set makeprg=eslint\ %
autocmd BufWritePost *.js execute 'MakeJob'
