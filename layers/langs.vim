scriptencoding utf-8

autocmd MyAutoCmd FileType javascript packadd vim-jsx-improve
let g:jsx_ext_required = 0

autocmd MyAutoCmd FileType markdown packadd vim-markdown
let g:markdown_fenced_languages = ['html', 'vim', 'javascript', 'python', 'bash=sh']

autocmd MyAutoCmd FileType jinja packadd vim-jinja
autocmd MyAutoCmd FileType twig packadd vim-twig
autocmd MyAutoCmd FileType coffee packadd vim-coffee-script
autocmd MyAutoCmd BufEnter * call timer_start(300, {-> functions#plug('txt.vim')}, {'repeat': 0})
