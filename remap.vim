scriptencoding utf-8

" nnoremap <Bs> :ls<CR>:b
nnoremap <space>b :b <C-d>
nnoremap <leader>f :find **/*
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
" paste after/before and adjust current indent
nnoremap p p`[=`]
nnoremap P P`[=`]
" word under cursor
cnoremap <M-w> <C-R><C-W>
" paste from clipboard
nnoremap <space>p :put+<CR>
vnoremap <space>p "+p
nnoremap <space>P :put!+<CR>
vnoremap <space>P "+P
inoremap <silent> <C-r> <C-r><C-p>
" replace a word with clipboard
nnoremap <space>w viw"+p
" yank to clipboard
vnoremap <space>y "+y
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
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
