scriptencoding utf-8

nnoremap j gj
nnoremap k gk
vnoremap > >gv
vnoremap < <gv
vnoremap . :normal .<cr>
nnoremap <c-s> :<c-u>update<cr>
inoremap <c-s> <esc>:update<cr>
xnoremap <c-s> <esc>:<c-u>update<cr>
nnoremap <expr> 0 virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
inoremap <c-a> <Home>
inoremap <c-e> <End>

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

" zoom
nnoremap <c-w>t :tabedit %<cr>

" file size
nnoremap <F3> :echo functions#getfilesize()<cr>

" disable EX-mode
nnoremap Q <Nop>
nnoremap gQ <Nop>

" execute macro
nnoremap Q @q

" search and star search
nnoremap * :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
vnoremap n :<c-u>let @/=functions#get_search_pat()<cr><esc><s-n>
vnoremap <s-n> :<c-u>let @/=functions#get_search_pat()<cr><esc><s-n>
vnoremap * :<c-u>let @/=functions#get_search_pat()<cr><esc><s-n>

" numbers
nnoremap <leader><leader> :set relativenumber!<cr>

" git commands
nnoremap <silent> <expr> <leader>dt ":\<C-u>"."windo ".(&diff?"diffoff":"diffthis")."\<CR>"
nnoremap <silent> <leader>gs :<C-u>Gstatus<CR>
nnoremap <silent> <leader>ga :<c-u>Dispatch! git add %<cr>
nnoremap <silent> <leader>gr :<c-u>Dispatch! git reset %<cr>
nnoremap <silent> <leader>gf :<c-u>Dispatch! git fetch --all --prune<cr>
nnoremap <silent> <leader>gu :<C-u>Dispatch! git pull --rebase --autostash<CR>
nnoremap <silent> <leader>gU :<C-u>Dispatch! git pull --ff-only<CR>
nnoremap <silent> <leader>gp :<C-u>Dispatch! git push<CR>
nnoremap <silent> <leader>gP :<C-u>Dispatch! git push -f<CR>
nnoremap <silent> <leader>gD :<C-u>Dispatch! git checkout -- %<CR>
nnoremap <silent> <leader>gd :<C-u>Gvdiff<CR>
nnoremap <silent> <leader>gc :<C-u>Gcommit<CR>
nnoremap <silent> <leader>gC :<C-u>Gcommit --amend<CR>
nnoremap <silent> <leader>gl :<C-u>GV --all<CR>

" grep
nnoremap gr :<C-u>Grep<Space>

function! remap#map() abort
endfunction
