" after apprentice layout and onedark colours

hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'nordish'

set background=dark

"+--- Editor ---+
hi ColorColumn guifg=NONE guibg=#3B4252
hi CursorLine guifg=NONE guibg=#3B4252 cterm=NONE
hi CursorColumn guibg=#3B4252
hi CursorLineNr guifg=#D8DEE9 guibg=#3B4252
hi Error guifg=#2E3440 guibg=#BF616A
hi LineNr  guifg=#4C566A guibg=#2E3440
hi MatchParen guifg=#88C0D0 guibg=#4C566A ctermfg=8 ctermbg=6
hi NonText guifg=#434C5E
hi Normal guifg=#D8DEE9 guibg=#2E3440
hi PMenu         guifg=#D8DEE9  guibg=#434C5E
hi PmenuSbar     guifg=#D8DEE9  guibg=#434C5E
hi PMenuSel      guifg=#88C0D0  guibg=#4C566A
hi PmenuThumb    guifg=#88C0D0  guibg=#4C566A
hi SpecialKey    guifg=#434C5E
hi SpellBad      guifg=#BF616A guibg=#2E3440
hi SpellCap      guifg=#EBCB8B guibg=#2E3440
hi SpellLocal    guifg=#E5E9F0 guibg=#2E3440
hi SpellRare     guifg=#ECEFF4 guibg=#2E3440
hi Visual        guibg=#434C5E
hi VisualNOS     guibg=#434C5E
" neovim support
hi healthError   guifg=#BF616A guibg=#3B4252  guifg=#2E3440
hi healthSuccess guifg=#A3BE8C guibg=#3B4252
hi healthWarning guifg=#A3BE8C guibg=#3B4252
hi TermCursorNC  guifg=NONE guibg=#3B4252

hi Folded guifg=#4C566A guibg=#3B4252
hi FoldColumn guifg=#4C566A guibg=#2E3440
hi SignColumn guifg=#3B4252 guibg=#2E3440

""+--- Navigation ---+
hi Directory guifg=#ECEFF4

"+--- Prompt/Status ---+
hi EndOfBuffer guifg=#3B4252
hi ErrorMsg guifg=#ff5f5f guibg=#161821 ctermfg=203 ctermbg=NONE
hi ModeMsg guifg=#D8DEE9
hi MoreMsg guifg=#D8DEE9
hi Question guifg=#D8DEE9 ctermfg=NONE
hi StatusLine       guifg=#D8DEE9 guibg=#5f6e87 gui=NONE cterm=NONE
hi StatusLineNC     guifg=#999999 guibg=#3c4a61 gui=NONE cterm=NONE
hi StatusLineTerm   guibg=#87875f guifg=#262626 gui=NONE
hi StatusLineTermNC guibg=#444444 guifg=#87875f gui=NONE
hi WarningMsg guifg=#d7ff5f ctermfg=185
hi WildMenu guifg=#88C0D0 guibg=#3B4252

"+--- Search ---+
hi IncSearch guifg=#282828 ctermfg=235 guibg=#ffffff ctermbg=15 gui=NONE cterm=NONE
" hi Search guifg=fg guibg=NONE ctermbg=NONE gui=Bold cterm=Bold
hi! Search ctermbg=LightCyan ctermfg=black guibg=LightCyan guifg=black

"+--- Tabs ---+
hi TabLine guifg=#D8DEE9 guibg=#3B4252 gui=NONE cterm=NONE
hi TabLineFill guifg=NONE guibg=#3B4252 gui=NONE cterm=NONE
hi TabLineSel guifg=#88C0D0 guibg=NONE gui=NONE cterm=NONE

"+--- Window ---+
hi Title guifg=#D8DEE9 guibg=NONE
hi VertSplit guifg=#2E3440 guibg=#434C5E ctermfg=8 ctermbg=0 cterm=NONE

"+ Language Base Groups +
hi Boolean guifg=#5E81AC guibg=NONE
hi Character guifg=#A3BE8C
hi Comment guifg=#4C566A
hi Conditional guifg=#81A1C1
hi Constant guifg=#D8DEE9
hi Define guifg=#81A1C1
hi Delimiter guifg=#ECEFF4
hi Exception guifg=#81A1C1
hi Float guifg=#B48EAD
hi Function guifg=#88C0D0
hi Identifier guifg=#D8DEE9
hi Include guifg=#81A1C1
hi Keyword guifg=#81A1C1
hi Label guifg=#81A1C1
hi Number guifg=#B48EAD
hi Operator guifg=#81A1C1
hi PreProc guifg=#81A1C1
hi Repeat guifg=#81A1C1
hi Special guifg=#D8DEE9
hi SpecialChar guifg=#EBCB8B
hi SpecialComment guifg=#88C0D0
hi Statement guifg=#81A1C1
hi StorageClass guifg=#81A1C1
hi String guifg=#A3BE8C
hi Structure guifg=#81A1C1
hi Tag guifg=#D8DEE9
hi Todo guifg=#EBCB8B
hi Type guifg=#81A1C1
hi Typedef guifg=#81A1C1
hi! link Macro Define
hi! link PreCondit PreProc

hi DiffAdd guifg=#A3BE8C guibg=#2E3440
hi DiffChange guifg=#EBCB8B guibg=#2E3440
hi DiffDelete guifg=#BF616A guibg=#2E3440
hi DiffText guifg=#81A1C1 guibg=#2E3440
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

"+--- Languages ---+
hi cssAttributeSelector guifg=#8FBCBB
hi cssDefinition guifg=#8FBCBB
hi cssIdentifier guifg=#8FBCBB
hi cssStringQ guifg=#8FBCBB
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

hi dosiniHeader guifg=#88C0D0
hi! link dosiniLabel Type

hi htmlArg guifg=#8FBCBB
hi htmlLink guifg=#D8DEE9
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH1
hi! link htmlH3 markdownH1
hi! link htmlH4 markdownH1
hi! link htmlH5 markdownH1
hi! link htmlH6 markdownH1
hi! link htmlSpecialChar SpecialChar
hi! link htmlTag Keyword
hi! link htmlTagN htmlTag

hi jsonKeyword guifg=#8FBCBB

hi markdownBlockquote guifg=#8FBCBB
hi markdownCode guifg=#8FBCBB
hi markdownCodeDelimiter guifg=#8FBCBB
hi markdownFootnote guifg=#8FBCBB
hi markdownId guifg=#8FBCBB
hi markdownIdDeclaration guifg=#8FBCBB
hi markdownH1 guifg=#88C0D0
hi markdownLinkText guifg=#88C0D0
hi markdownUrl guifg=#D8DEE9
hi! link markdownBold Bold
hi! link markdownBoldDelimiter Keyword
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter Keyword
hi! link markdownItalic Italic
hi! link markdownItalicDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownListMarker Keyword
hi! link markdownRule Keyword
hi! link markdownHeadingDelimiter Keyword

hi phpClasses guifg=#8FBCBB
hi phpDocTags guifg=#8FBCBB
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

hi rustAttribute guifg=#5E81AC
hi rustEnum guifg=#8FBCBB
hi rustMacro guifg=#ECEFF4
hi rustModPath guifg=#8FBCBB
hi rustPanic guifg=#81A1C1
hi rustTrait guifg=#8FBCBB
hi! link rustCommentLineDoc Comment
hi! link rustDerive rustAttribute
hi! link rustEnumVariant rustEnum
hi! link rustEscape SpecialChar
hi! link rustQuestionMark Keyword

hi sassClass guifg=#8FBCBB
hi sassId guifg=#8FBCBB
hi! link sassAmpersand Keyword
hi! link sassClassChar Delimiter
hi! link sassControl Keyword
hi! link sassControlLine Keyword
hi! link sassExtend Keyword
hi! link sassFor Keyword
hi! link sassFunctionDecl Keyword
hi! link sassFunctionName Function
hi! link sassidChar sassId
hi! link sassInclude SpecialChar
hi! link sassMixinName Function
hi! link sassMixing SpecialChar
hi! link sassReturn Keyword

hi! link shCmdParenRegion Delimiter
hi! link shCmdSubRegion Delimiter
hi! link shDerefSimple Identifier
hi! link shDerefVar Identifier

hi! link sqlKeyword Keyword
hi! link sqlSpecial Keyword

hi vimAugroup guifg=#8FBCBB
hi vimMapRhs guifg=#8FBCBB
hi vimNotation guifg=#8FBCBB
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

hi yamlBlockMappingKey guifg=#8FBCBB
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+ Plugin Support +
" ALE
" > w0rp/ale
hi ALEWarningSign guifg=#EBCB8B
hi ALEErrorSign guifg=#BF616A
hi ALEWarning guifg=#EBCB8B
hi ALEError guifg=#BF616A

" Coc
" > neoclide/coc
hi CocWarningSign guifg=#EBCB8B
hi CocErrorSign guifg=#BF616A
hi CocInfoSign guifg=#88C0D0
hi CocHintSign guifg=#5E81AC

" GitGutter
" > airblade/vim-gitgutter
hi GitGutterAdd guifg=#A3BE8C
hi GitGutterChange guifg=#EBCB8B
hi GitGutterChangeDelete guifg=#BF616A
hi GitGutterDelete guifg=#BF616A

" Signify
" > mhinz/vim-signify
hi SignifySignAdd guifg=#A3BE8C
hi SignifySignChange guifg=#EBCB8B
hi SignifySignChangeDelete guifg=#BF616A
hi SignifySignDelete guifg=#BF616A

" fugitive.vim
" > tpope/vim-fugitive
hi gitcommitDiscardedFile guifg=#BF616A
hi gitcommitUntrackedFile guifg=#BF616A
hi gitcommitSelectedFile guifg=#A3BE8C

" vim-startify
hi StartifyFile guifg=#ECEFF4
hi StartifyFooter guifg=#8FBCBB
hi StartifyHeader guifg=#88C0D0
hi StartifyNumber guifg=#8FBCBB
hi StartifyPath guifg=#88C0D0
hi! link StartifyBracket Delimiter
hi! link StartifySlash Normal
hi! link StartifySpecial Comment

" > pangloss/vim-javascript
hi jsGlobalNodeObjects guifg=#88C0D0
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsThis Keyword
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar
