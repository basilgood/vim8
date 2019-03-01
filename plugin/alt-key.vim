scriptencoding utf-8

"""" Alt-arrows move between windows
nnoremap <silent> <M-Left> <C-w><Left>
nnoremap <silent> <M-Right> <C-w><Right>
nnoremap <silent> <M-Up> <C-w><Up>
nnoremap <silent> <M-Down> <C-w><Down>
nnoremap <silent> <M-v> :<C-u>vsplit<CR>
nnoremap <silent> <M-s> :<C-u>split<CR>
nnoremap <silent> <M-o> :<C-u>only<CR>
nnoremap <silent> <M-c> :<C-u>close<CR>
nnoremap <silent> <M-t> :<C-u>tab split<CR>

"""" Alt-hjkl resize windows
nnoremap <silent> <M-l> :vertical resize +5<cr>
nnoremap <silent> <M-h> :vertical resize -5<cr>
nnoremap <silent> <M-j> :resize +5<cr>
nnoremap <silent> <M-k> :resize -5<cr>
