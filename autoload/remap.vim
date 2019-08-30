scriptencoding utf-8

nnoremap j gj
nnoremap k gk
vnoremap > >gv
vnoremap < <gv
nnoremap <c-s> :<c-u>update<cr>
inoremap <c-s> <esc>:update<cr>
xnoremap <c-s> <esc>:<c-u>update<cr>
nnoremap <expr> 0 virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
inoremap <c-a> <Home>
inoremap <c-e> <End>

" windows
nnoremap <silent> <Tab> :wincmd w<CR>

" completion: enter select and close popup
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"
" completion down key is simulated
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
      \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" paste from register 0
vnoremap . "0p

" yank from cursor position to end of line
nnoremap Y y$

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

" file size
nnoremap <F3> :echo functions#getfilesize()<cr>

" disable EX-mode
nnoremap Q <Nop>
nnoremap gQ <Nop>

" execute macro
nnoremap Q @q
" Run macro on selected lines
vnoremap Q :norm Q<cr>

" search and star search
nnoremap * :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
nnoremap c* :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>cgn
nnoremap d* :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>cgn
vnoremap n :<c-u>let @/=functions#get_search_pat()<cr><esc><s-n>
vnoremap <s-n> :<c-u>let @/=functions#get_search_pat()<cr><esc><s-n>
vnoremap * :<c-u>let @/=functions#get_search_pat()<cr><esc><s-n>

" numbers
nnoremap <leader><leader> :set relativenumber!<cr>

" git commands
nnoremap <silent> <expr> <leader>dt ":\<C-u>"."windo ".(&diff?"diffoff":"diffthis")."\<CR>"
nnoremap <silent> gs :<C-u>Gstatus<CR>
nnoremap <silent> <leader>ga :<c-u>Dispatch! git add %<cr>
nnoremap <silent> <leader>gr :<c-u>Dispatch! git reset %<cr>
nnoremap <silent> <leader>gf :<c-u>Dispatch! git fetch --all --prune<cr>
nnoremap <silent> <leader>gu :<C-u>Dispatch! git pull --rebase --autostash<CR>
nnoremap <silent> <leader>gU :<C-u>Dispatch! git pull --ff-only<CR>
nnoremap <silent> <leader>gp :<C-u>Dispatch! git push<CR>
nnoremap <silent> <leader>gP :<C-u>Dispatch! git push -f<CR>
nnoremap <silent> <leader>gD :<C-u>Dispatch! git checkout -- %<CR>
nnoremap <silent> <leader>gd :<C-u>Gvdiffsplit<CR>
nnoremap <silent> <leader>gc :<C-u>Gcommit<CR>
nnoremap <silent> <leader>gC :<C-u>Gcommit --amend<CR>
nnoremap <silent> <leader>gl :<C-u>GV --all<CR>

" grep
nnoremap gr :<C-u>Grep<Space>

" commands history
nnoremap <leader>] :CmdHist<cr>

" smart space mapping
nmap <Space> [Space]
nnoremap  [Space] <Nop>
vmap <Space> [Space]
vnoremap  [Space] <Nop>

" substitute
nnoremap ss :%s/

" substitute in visual mode
vnoremap s :s/

" substitute inline
nnoremap sl :s/
nnoremap sr :s/\<<C-r><C-w>\>/

" append text
nnoremap sa :%s/\<<c-r><c-w>\>/<c-r><c-w>

" substitute in paragraph
nnoremap sp vip :s/

" substitute word under the cursor globally
nnoremap sw :%s/\<<c-r><c-w>\>/

" yank to clipboard
vnoremap [Space]y "+y

" paste from clipboard
nnoremap [Space]p :put+<cr>
vnoremap [Space]p "+p
nnoremap [Space]P :put!+<cr>
vnoremap [Space]P "+P
inoremap <silent> <C-r> <C-r><C-p>

" replace a word with clipboard
nnoremap [Space]w viw"+p

" switch buffers
nnoremap [Space]1 1<c-w>w
nnoremap [Space]2 2<c-w>w
nnoremap [Space]3 3<c-w>w
nnoremap [Space]4 4<c-w>w
nnoremap [Space]5 5<c-w>w
nnoremap [Space]6 6<c-w>w
nnoremap [Space]7 7<c-w>w
nnoremap [Space]8 8<c-w>w
nnoremap [Space]9 9<c-w>w

" s mapping
" splitting
nnoremap <silent> [Space]v  :<C-u>vsplit<CR>
nnoremap <silent> [Space]s  :<C-u>split<CR>
nnoremap <silent> [Space]c  :<C-u>close<CR>
nnoremap <silent> [Space]o  :<C-u>only<CR>
nnoremap [Space]t :tabedit %<cr>
nnoremap <silent> <S-tab> :tabnext<CR>

function! remap#map() abort
endfunction
