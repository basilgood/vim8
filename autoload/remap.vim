scriptencoding utf-8

nnoremap j gj
nnoremap k gk
vnoremap > >gv
vnoremap < <gv
vnoremap . :normal .<cr>
nnoremap <C-s> :update<cr>
inoremap <C-s> <Esc>:update<cr>
xnoremap <C-s> <C-C>:<C-u>update<cr>
nnoremap <expr> 0 virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <M-o> <C-O>o
inoremap <M-O> <C-O>O

" completion: enter select and close popup
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"

" paste after/before and adjust current indent
nnoremap p p`[=`]
nnoremap P P`[=`]

" paste from clipboard
nnoremap <space>p :put+<cr>
vnoremap <space>p "+p
nnoremap <space>P :put!+<cr>
vnoremap <space>P "+P
inoremap <silent> <C-r> <C-r><C-p>

" replace a word with clipboard
nnoremap <space>w viw"+p

" yank to clipboard
vnoremap <space>y "+y

" yank from cursor position to end of line
nnoremap Y y$

" prev and next buffer
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" substitute
nnoremap <leader>s :%s/
vnoremap <leader>s :s/
" substitute word under the cursor globally
nnoremap <leader>w :%s/\<<c-r><c-w>\>/
" substitute inline
nnoremap <leader>l :s/
" append text
nnoremap <leader>a :%s/\<<c-r><c-w>\>/<c-r><c-w>

" lists
nnoremap ]l :lnext<cr>
nnoremap [l :lprevious<cr>
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>
nnoremap ]Q :clast<cr>
nnoremap [Q :cfirst<cr>

" search results appear in the middle of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" fzy
nnoremap <c-p> :call fzy#find("fd --type f --hidden --exclude '.git' .", ":e")<cr>

" grep
nnoremap gr :<C-u>Grp<Space>

" niceblock
xnoremap <expr> I (mode()=~#'[vV]'?'<C-v>^o^I':'I')
xnoremap <expr> A (mode()=~#'[vV]'?'<C-v>0o$A':'A')

" innerline
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<cr>

" entire
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<cr>

" mapping for spelling correction
nnoremap <space>s :set spell!<cr>
nnoremap <space>z 1z=

" file size
nnoremap <F3> :echo functions#getfilesize()<cr>

"""" mistype
cabbrev Qa qa
cabbrev QA qa
cabbrev Wq wq
cabbrev WQ wq

"""" git commands
nnoremap <leader>dt :<c-r>=&diff ? 'diffoff' : 'diffthis'<cr><cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gc :Git checkout<space>
nnoremap <leader>gp :GP<cr>
nnoremap <leader>gf :GPF<cr>

" Window navigation
nnoremap <leader>1 1<c-w>w
nnoremap <leader>2 2<c-w>w
nnoremap <leader>3 3<c-w>w
nnoremap <leader>4 4<c-w>w
nnoremap <leader>5 5<c-w>w
nnoremap <leader>6 6<c-w>w
nnoremap <leader>7 7<c-w>w
nnoremap <leader>8 8<c-w>w
nnoremap <leader>9 9<c-w>w
nnoremap <leader>0 10<c-w>w

function! remap#map() abort
endfunction
