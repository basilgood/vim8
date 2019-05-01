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

" close and keep layout
nnoremap q :bn<cr>:bd#<cr>

" ctrlp
nnoremap <c-p> :call fzy#find("fd --type f --hidden --exclude '.git' .", ":e")<cr>

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

" smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

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
nnoremap <silent> v :<C-u>vsplit<cr>
nnoremap <silent> s :<C-u>split<cr>
nnoremap <silent> o :<C-u>only<cr>
nnoremap <silent> c :<C-u>close<cr>
nnoremap <silent> d :<C-u>bd<cr>
nnoremap <silent> t :<C-u>tab split<cr>

"""" Alt-hjkl resize windows
nnoremap <silent> l :vertical resize +5<cr>
nnoremap <silent> h :vertical resize -5<cr>
nnoremap <silent> j :resize +5<cr>
nnoremap <silent> k :resize -5<cr>

function! remap#map() abort
endfunction
