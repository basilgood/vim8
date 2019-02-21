scriptencoding utf-8

"""" Alt-arrows move between windows
nnoremap <silent> [1;3A <C-w><Up>
nnoremap <silent> [1;3B <C-w><Down>
nnoremap <silent> [1;3C <C-w><Right>
nnoremap <silent> [1;3D <C-w><Left>
nnoremap <silent> v :<C-u>vsplit<CR>
nnoremap <silent> s :<C-u>split<CR>
nnoremap <silent> o :<C-u>only<CR>
nnoremap <silent> c :<C-u>close<CR>
nnoremap <silent> t :<C-u>tab split<CR>

"""" Alt-hjkl resize windows
nnoremap <silent> l :vertical resize +5<cr>
nnoremap <silent> h :vertical resize -5<cr>
nnoremap <silent> j :resize +5<cr>
nnoremap <silent> k :resize -5<cr>
