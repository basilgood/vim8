scriptencoding utf-8

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

"""" Alt-arrows move between windows
nnoremap <silent> <M-Left> <C-w><Left>
nnoremap <silent> <M-Right> <C-w><Right>
nnoremap <silent> <M-Up> <C-w><Up>
nnoremap <silent> <M-Down> <C-w><Down>
nnoremap <silent> <M-v> :<C-u>vsplit<CR>
nnoremap <silent> <M-s> :<C-u>split<CR>
nnoremap <silent> <M-o> :<C-u>only<CR>
nnoremap <silent> <M-c> :<C-u>close<CR>
nnoremap <silent> <M-d> :<C-u>bd<CR>
nnoremap <silent> <M-t> :<C-u>tab split<CR>

"""" Alt-hjkl resize windows
nnoremap <silent> <M-l> :vertical resize +5<cr>
nnoremap <silent> <M-h> :vertical resize -5<cr>
nnoremap <silent> <M-j> :resize +5<cr>
nnoremap <silent> <M-k> :resize -5<cr>
