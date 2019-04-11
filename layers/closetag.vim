scriptencoding utf-8

if !exists('g:loaded_closetag')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> functions#plug('vim-closetag')}, {'repeat': 0})
endif

let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,.*twig'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,.*js,.*twig'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,javascript,twig'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,javascript,twig'
