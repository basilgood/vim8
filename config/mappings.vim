nnoremap <Space>n :nohlsearch<CR>
nnoremap j gj
nnoremap k gk
vnoremap > >gv
vnoremap < <gv
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>
xnoremap <C-s> <C-C>:<C-u>update<CR>
nnoremap <expr> 0 virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
vnoremap . :normal .<CR>
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<CR>
nnoremap ,w :set wrap!<cr>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>
nnoremap <Space><Space> :tab split<CR>
nnoremap <Space>q :tabclose<CR>
vnoremap <Space>y "+y
nnoremap <Space>p "+p
vnoremap <Space>p "+p
nnoremap <Space>P "+P
vnoremap <Space>P "+P
inoremap <C-v> <ESC>"+gPa
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
