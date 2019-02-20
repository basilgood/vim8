scriptencoding utf-8

" nnoremap <Bs> :ls<CR>:b
nnoremap <space>b :b <C-d>
nnoremap <leader>f :find *
nnoremap j gj
nnoremap k gk
vnoremap > >gv
vnoremap < <gv
vnoremap . :normal .<CR>
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>
xnoremap <C-s> <C-C>:<C-u>update<CR>
nnoremap <expr> 0 virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<CR>
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>
" replace a word with clipboard
nnoremap <space>w viw"+p
" paste from clipboard
nnoremap <space>p :put+<CR>
vnoremap <space>p "+p
nnoremap <space>P :put!+<CR>
vnoremap <space>P "+P
" yank to clipboard
vnoremap <space>y "+y
" substitute
nnoremap <leader>s :%s/
vnoremap <leader>s :s/
" substitute word under the cursor
nnoremap <leader>w :%s/\<<c-r><c-w>\>/
" append text
nnoremap <leader>a :%s/\<<C-r><C-w>\>/<C-r><C-w>
" yank from cursor position to end of line
nnoremap Y y$
" prev and next buffer
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
" lists
nnoremap ]l :lnext<cr>
nnoremap [l :lprevious<cr>
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>
nnoremap ]Q :clast<cr>
nnoremap [Q :cfirst<cr>

" nohlsearch
nnoremap <space>n :nohlsearch<CR>

"""" add a blank line above/below
nnoremap ]<space> m`o<Esc>``
nnoremap [<space> m`O<Esc>``

"""" mistype
cabbrev Qa qa
cabbrev QA qa
cabbrev Wq wq
cabbrev WQ wq
