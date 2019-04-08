scriptencoding utf-8

let g:gutentags_cache_dir = $HOME .'/.cache/guten_tags'
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_new = 1
let g:gutentags_ctags_exclude_wildignore = 1
let g:gutentags_ctags_exclude = [
      \ '*/wp-admin', '*/wp-content', '*/wp-includes',
      \ '*/application/vendor', '*/vendor/ckeditor', '*/media/vendor'
      \ ]
