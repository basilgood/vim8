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

" new line
nnoremap <expr> go "mz" . v:count . "o\<Esc>`z"
nnoremap <expr> gO "mz" . v:count . "O\<Esc>`z"
inoremap <M-o> <C-O>o
inoremap <M-O> <C-O>O

" completion: enter select and close popup
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"

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

" substitute
nnoremap <leader>s :%s/
vnoremap <leader>s :s/
" substitute word under the cursor globally
nnoremap <leader>w :%s/\<<c-r><c-w>\>/
" substitute inline
nnoremap <leader>l :s/
" append text
nnoremap <leader>a :%s/\<<c-r><c-w>\>/<c-r><c-w>

" prev and next buffer
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" lists
nnoremap ]l :lnext<cr>
nnoremap [l :lprevious<cr>
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>
nnoremap ]Q :clast<cr>
nnoremap [Q :cfirst<cr>

" center search and nohl
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zvzz
nnoremap # #zvzz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz
nnoremap } }zz
nnoremap { {zz
nnoremap g; g;zz
nnoremap g, g,zz

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

" numbers
nnoremap <leader>n :set relativenumber!<cr>

"""" git commands
nnoremap <leader>dt :<c-r>=&diff ? 'diffoff' : 'diffthis'<cr><cr>
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gr :Git reset %:p<CR><CR>
nnoremap <leader>gcc :Gcommit -v -q %:p<CR>
nnoremap <leader>gca :Gcommit --amend<CR>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :tab sp<cr>:Gdiff<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>gf :Gpush -f<cr>
nnoremap <leader>gl :Git lg --all<cr>
nnoremap <leader>go :Git checkout<space>

" grep
nnoremap gr :<C-u>Grp<Space>

function! remap#map() abort
endfunction
