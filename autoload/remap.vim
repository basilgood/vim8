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

" niceblock
xnoremap <expr> I (mode()=~#'[vV]'?'<C-v>^o^I':'I')
xnoremap <expr> A (mode()=~#'[vV]'?'<C-v>0o$A':'A')

" innerline
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<CR>

" entire
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<CR>

" mapping for spelling correction
nnoremap <space>s :set spell!<CR>
nnoremap <space>z 1z=

" file size
nnoremap <F3> :echo functions#getfilesize()<cr>

"""" mistype
cabbrev Qa qa
cabbrev QA qa
cabbrev Wq wq
cabbrev WQ wq

"""" Alt-arrows move between windows
nnoremap <silent> <M-Left> <C-w><Left>
nnoremap <silent> <M-Right> <C-w><Right>
nnoremap <silent> <M-Up> <C-w><Up>
nnoremap <silent> <M-Down> <C-w><Down>

"""" Alt split
nnoremap <silent> v :<C-u>vsplit<CR>
nnoremap <silent> s :<C-u>split<CR>
nnoremap <silent> o :<C-u>only<CR>
nnoremap <silent> c :<C-u>close<CR>
nnoremap <silent> d :<C-u>bd<CR>
nnoremap <silent> t :<C-u>tab split<CR>

"""" Alt-hjkl resize windows
nnoremap <silent> l :vertical resize +5<cr>
nnoremap <silent> h :vertical resize -5<cr>
nnoremap <silent> j :resize +5<cr>
nnoremap <silent> k :resize -5<cr>

function! remap#map() abort
endfunction
