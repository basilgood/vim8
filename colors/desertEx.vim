set background=dark

hi clear
if exists('syntax_on')
   syntax reset
endif

let g:colors_name='desertEX'

" :h highlight-groups

"" GUI
hi Normal         guifg=#bebebe   guibg=#262626   gui=NONE   cterm=none
hi Title          guifg=#cd5c5c                   gui=NONE   cterm=none
hi LineNr         guifg=#605958   guibg=NONE      gui=NONE   cterm=none
" hi Cursor         guifg=#000000   guibg=#ffff00   gui=NONE   cterm=none " TODO
" TODO: not display in diff mode
hi CursorLine                     guibg=#333333              cterm=none
hi CursorLineNr                                   gui=NONE   cterm=none
" hi ColorColumn    guifg=NONE      guibg=darkred   gui=NONE   cterm=none " TODO
hi Visual         guifg=NONE      guibg=#373b41   gui=NONE   cterm=none
hi VertSplit      guifg=#666666   guibg=#666666   gui=NONE   cterm=none
" unprintable characters
hi SpecialKey     guifg=#605958                   gui=NONE   cterm=none
" nbsp, tab and trail
hi Whitespace     guifg=#605958                   gui=NONE   cterm=none
hi MatchParen     guifg=#00ffff   guibg=NONE      gui=bold   cterm=none

" fold
hi Folded       guifg=#999999   guibg=#2b2e36   gui=NONE   cterm=none
hi FoldColumn   guifg=#d2b48c   guibg=#4d4d4d   gui=NONE   cterm=none

" search
hi Search      guifg=#cccccc   guibg=#445599   gui=NONE   cterm=none
hi IncSearch   guifg=#b0ffff   guibg=#2050d0              cterm=none

" messages
hi ErrorMsg     guifg=#ffffff   guibg=#ff0000   gui=NONE   cterm=none
hi ModeMsg      guifg=#87ceeb                   gui=NONE   cterm=none
hi MoreMsg      guifg=#2e8b57                   gui=NONE   cterm=none
hi WarningMsg   guifg=#fa8072                   gui=NONE   cterm=none
hi Question     guifg=#00ff7f                   gui=NONE   cterm=none

" menus
hi Pmenu      guifg=#ffffff   guibg=#445599   gui=NONE   cterm=none
hi PmenuSel   guifg=#445599   guibg=#bebebe              cterm=none
hi WildMenu   guifg=#f0a0c0   guibg=#302028   gui=NONE   cterm=none

" diff
hi DiffAdd      guifg=#000000   guibg=#ffe7ba              cterm=none
hi DiffDelete   guifg=#000000   guibg=#737373   gui=NONE   cterm=none
hi DiffChange   guifg=#000000   guibg=#87ceff              cterm=none
hi DiffText     guifg=#000000   guibg=#ff6eb4   gui=NONE   cterm=none

" code
hi Comment      guifg=#7ccd7c                   gui=italic   cterm=none
hi Constant     guifg=#fa8072                   gui=NONE     cterm=none
hi Identifier   guifg=#87ceeb                   gui=NONE     cterm=none
hi Function     guifg=#87ceeb                   gui=NONE     cterm=none
hi Statement    guifg=#eedc82                   gui=NONE     cterm=none
hi PreProc      guifg=#ee799f                   gui=NONE     cterm=none
hi Type         guifg=#ffa54f                   gui=NONE     cterm=none
hi Special      guifg=#76eec6                   gui=NONE     cterm=none
hi Ignore       guifg=#666666                   gui=NONE     cterm=none
hi Todo         guifg=#ff4500   guibg=#eeee00   gui=NONE     cterm=none

" EOF tildas (~)
hi NonText   guifg=#3465A4   gui=NONE   cterm=none

" status line
hi StatusLine     guifg=#bebebe   guibg=#4d5057   gui=NONE   cterm=none
hi StatusLineNC   guifg=#bebebe   guibg=#787878   gui=NONE   cterm=none

" number of lines and column
hi User1   guifg=#ffd75f   guibg=#4d5057   gui=NONE   cterm=none
" ❬ and ❭
hi User2   guifg=#121212   guibg=#4d5057   gui=NONE   cterm=none
" file name
hi User3   guifg=#86bcff   guibg=#4d5057   gui=NONE   cterm=none
" [RO], [+] and fileformat
hi User4   guifg=#ff7575   guibg=#4d5057   gui=NONE   cterm=none
" filetype
hi User5   guifg=#ffab60   guibg=#4d5057   gui=NONE   cterm=none

" hi Underlined   guifg=darkmagenta
" hi Error        guifg=white         guibg=red
hi Directory      guifg=#6871ff

"" TUI
" Only really needed for the kernel console as otherwise the GUI colors will
" be used because of 'termguicolors
if $TERM == 'linux'
   hi Normal         ctermfg=white      ctermbg=black
   hi Title          ctermfg=red
   hi LineNr         ctermfg=darkgrey   ctermbg=NONE
   " hi Cursor         ctermfg=black      ctermbg=yellow
   hi CursorLine                        ctermbg=NONE
   hi CursorLineNr   ctermfg=yellow
   hi ColorColumn    ctermfg=NONE       ctermbg=red
   hi Visual         ctermfg=NONE       ctermbg=cyan
   hi VertSplit      ctermfg=NONE       ctermbg=lightgrey
   " nbsp, tab and trail
   hi SpecialKey     ctermfg=darkgrey
   hi MatchParen     ctermfg=NONE       ctermbg=cyan        cterm=bold

   " fold
   hi Folded       ctermfg=darkgrey   ctermbg=NONE
   hi FoldColumn   ctermfg=darkgrey   ctermbg=NONE

   " search
   hi Search      ctermfg=grey   ctermbg=blue
   hi IncSearch   ctermfg=blue   ctermbg=cyan

   " messages
   hi ErrorMsg     ctermfg=white       ctermbg=red
   hi ModeMsg      ctermfg=blue
   hi MoreMsg      ctermfg=darkgreen
   hi WarningMsg   ctermfg=red
   hi Question     ctermfg=green

   hi Pmenu      ctermfg=white         ctermbg=darkmagenta
   hi PmenuSel   ctermfg=darkmagenta   ctermbg=white
   hi WildMenu   ctermfg=magenta       ctermbg=NONE

   " diff
   hi DiffAdd      ctermfg=black   ctermbg=yellow
   hi DiffDelete   ctermfg=black   ctermbg=lightgrey
   hi DiffChange   ctermfg=black   ctermbg=blue
   hi DiffText     ctermfg=black   ctermbg=red

   " code
   hi Comment      ctermfg=green
   hi Constant     ctermfg=red
   hi Identifier   ctermfg=blue
   hi Function     ctermfg=blue
   hi Statement    ctermfg=yellow
   hi PreProc      ctermfg=magenta
   hi Type         ctermfg=darkgreen
   hi Special      ctermfg=cyan
   hi Ignore       ctermfg=darkgrey
   hi Todo         ctermfg=black       ctermbg=yellow

   " EOF tildas (~)
   hi NonText   ctermfg=darkblue

   " status line
   hi StatusLine     ctermfg=white   ctermbg=lightgrey
   hi StatusLineNC   ctermfg=white   ctermbg=white

   hi User1   ctermfg=yellow   ctermbg=lightgrey
   hi User2   ctermfg=black    ctermbg=lightgrey
   hi User3   ctermfg=blue     ctermbg=lightgrey
   hi User4   ctermfg=red      ctermbg=lightgrey
   hi User5   ctermfg=brown    ctermbg=lightgrey

   hi Underlined   ctermfg=darkmagenta
   hi Error        ctermfg=white         ctermbg=red
   hi Directory    ctermfg=blue
endif
