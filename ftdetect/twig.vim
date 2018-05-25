if !exists('g:vim_twig_filetype_detected') && has('autocmd')
  autocmd BufNewFile,BufRead *.twig setlocal filetype=html.twig
  autocmd BufNewFile,BufRead *.html.twig setlocal filetype=html.twig
  autocmd BufNewFile,BufRead *.xml.twig setlocal filetype=xml.twig
endif
