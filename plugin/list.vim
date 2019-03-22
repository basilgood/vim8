scriptencoding utf-8

"""" list
set list
let &g:listchars = 'tab:▸ ,space:·,extends:❯,precedes:❮,nbsp:⦸'
autocmd MyAutoCmd InsertEnter * set listchars-=trail:␣
autocmd MyAutoCmd InsertLeave * set listchars+=trail:␣
