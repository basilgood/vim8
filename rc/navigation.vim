scriptencoding utf-8

" vinegar
call add(g:plugins.opt, $GITHUB_COM.'tpope/vim-vinegar')
let g:netrw_bufsettings         = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted hidden'
let g:netrw_sort_dotfiles_first = 1
let g:netrw_altfile             = 1
let g:netrw_dirhistmax          = 0
autocmd vimRc FileType netrw call functions#innetrw()

" fzf
call add(g:plugins.opt, $GITHUB_COM.'junegunn/fzf')
call add(g:plugins.opt, $GITHUB_COM.'junegunn/fzf.vim')
let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
let g:fzf_layout = { 'down': '~35%' }
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \}
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
nnoremap <c-p> :Files<cr>
nnoremap =- :Files %:p:h<cr>
let g:buffer_action = {
      \ 'ctrl-x': 'sb',
      \ 'ctrl-v': 'vsp|b',
      \ 'ctrl-w': 'bdelete'
      \}

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! BufferSink(lines)
  if len(a:lines)<2
    return
  endif
  let key = remove(a:lines, 0)
  let Cmd = get(g:buffer_action, key,'buffer')
  for line in a:lines
    let bid = matchstr(line, '^[ 0-9]*')
    execute Cmd bid
  endfor
endfunction
noremap <silent> <Bs> :call fzf#run(fzf#wrap({
      \ 'source':  reverse(<sid>buflist()),
      \ 'sink*':  function('BufferSink'),
      \ 'options': '-m --expect='.join(keys(buffer_action), ',')
      \ }))<CR>
nnoremap <silent> <leader>] :History:<cr>
