scriptencoding utf-8

Plugin 'tpope/vim-vinegar'
let g:netrw_bufsettings = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted hidden'
let g:netrw_sort_dotfiles_first = 1
let g:netrw_altfile = 1
let g:netrw_home = $CACHE
nmap - :call vivid#enable('vim-vinegar')<cr><Plug>VinegarUp
autocmd VGroup FileType netrw call functions#innetrw()

" Plugin 'junegunn/fzf', { 'enabled': 1 }
Plugin 'junegunn/fzf.vim'
nnoremap <c-p> :call vivid#enable('fzf.vim')<cr>:Files<cr>
nnoremap <bs> :Buffers<cr>
call fz_f#fzf()
