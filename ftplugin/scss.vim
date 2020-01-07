scriptencoding utf-8

call sacp#enableForThisBuffer({ 'matches': [
      \ { '=~': '\v[a-zA-Z]{2}$', 'feedkeys': "\<C-x>\<C-o>"},
      \ { '=~': '\.$'           , 'feedkeys': "\<C-x>\<C-n>"},
      \ { '=~': '\#$'           , 'feedkeys': "\<C-x>\<C-n>"},
      \ { '=~': '\: $'          , 'feedkeys': "\<C-x>\<C-o>"},
      \ ]
      \ })
