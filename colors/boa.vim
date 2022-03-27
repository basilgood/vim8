vim9script

set background=dark
highlight clear
syntax reset
g:colors_name = 'boa'

const colors = {
    red: '#d35b4b',
    redish: '#e62922',
    green: '#8f9e44',
    yellow: '#caa247',
    blue: '#919697',
    darkblue: '#898fac',
    purple: '#b2809f',
    aqua: '#70a17c',
    orange: '#c57c41',
    gray: '#817466',
    brown: '#826a33',
    cursorlinebg: '#292523',
    black: '#0a0707',
    normal: '#b8af96',
    visual: '#3d3834',
    graish: '#7c6f64',
    bright: '#a89984',
}

g:terminal_ansi_colors = [
    '#1f1a17',
    colors.red,
    colors.green,
    colors.orange,
    '#7680ac',
    colors.purple,
    '#70a195',
    '#8c8572',
    '#6e685a',
    colors.red,
    colors.green,
    colors.yellow,
    '#7680ac',
    colors.purple,
    '#70a195',
    colors.normal
]

const bold = { bold: 1 }
const italic = { italic: 1 }
const underline = { underline: 1 }
const bold_underline = { bold: 1, underline: 1 }

def HlSet(name: string, fg = 'NONE', bg = 'NONE', attr = {}, attr_color = 'NONE')
    hlset([{ name: name, guifg: fg, guibg: bg, cterm: attr, guisp: attr_color,
             ctermfg: 'NONE', ctermbg: 'NONE', ctermul: 'NONE',
             gui: {}, start: 'NONE', stop: 'NONE', term: {} }])
enddef

def HlLinks(names: list<string>, linksto: string)
    var links = []
    for name in names
        add(links, { name: name, linksto: linksto, force: v:true })
    endfor
    hlset(links)
enddef

# :help group-name
# :help highlight-default
HlSet('Comment', colors.gray)
HlSet('LineNr', colors.gray)
HlLinks(
    [
        'xmlDocTypeDecl',
        'xmlCdataStart',
        'dtdFunction',
        'xmlProcessingDelim',
        'dtdParamEntityPunct',
        'dtdParamEntityDPunct',
        'xmlAttribPunct',
        'markdownBlockquote',
        'markdownListMarker',
        'markdownOrderedListMarker',
        'markdownRule',
        'markdownHeadingRule',
        'typeScriptDocSeeTag',
        'typeScriptDocParam',
    ],
    'Comment'
)

HlSet('Constant', colors.purple)
HlLinks(
    [
        'Character',
        'Number',
        'Boolean',
        'Float',
        # ---
        'goConstants',
        'htmlScriptTag',
        'xmlDocTypeKeyword',
        'xmlCdataCdata',
        'dtdTagName',
        'cOperator',
        'pythonExceptions',
        'pythonBoolean',
        'javaScriptNumber',
        'javaScriptNull',
        'jsNull',
        'jsUndefined',
        'typeScriptNull',
        'markdownUrl',
        'haskellNumber',
        'haskellPragma',
        'svelteKeyword',
    ],
    'Constant'
)

HlSet('String', colors.green)
HlLinks(
    [
        'Question',
        # ---
        'CocInfoSign',
        'GitGutterAdd',
        'diffAdded',
        'cssClassName',
        'cssImportant',
        'markdownUrlTitleDelimiter',
        'haskellString',
        'haskellChar',
        'jsonKeyword',
        'jsonQuote',
    ],
    'String'
)

HlSet('Identifier', colors.blue)
HlLinks(
    [
        'Conceal',
        'diffLine',
        # ---
        'htmlTag',
        'htmlEndTag',
        'xmlTag',
        'xmlEndTag',
        'xmlTagName',
        'xmlEqual',
        'pythonInclude',
        'pythonImport',
        'pythonRun',
        'pythonCoding',
        'cssBraces',
        'cssColor',
        'cssSelectorOp',
        'cssSelectorOp2',
        'javaScriptMember',
        'goDeclType',
    ],
    'Identifier'
)

HlSet('Function', colors.darkblue)
HlLinks(
    [
        'pythonDottedName',
        'luaFuncCall',
        'haskellIdentifier',
    ],
    'Function'
)

HlSet('Statement', colors.red)
HlLinks(
    [
        'Conditional',
        'Repeat',
        'Label',
        'Operator',
        'Keyword',
        'Exception',
        'diffRemoved',
        # ---
        'CocErrorSign',
        'ALEErrorSign',
        'GitGutterDelete',
        'vimNotFunc',
        'vimFunction',
        'pythonDecorator',
        'pythonOperator',
        'pythonException',
        'pythonConditional',
        'pythonRepeat',
        'javaScriptIdentifier',
        'goDeclaration',
        'luaIn',
        'haskellOperators',
        'tomlTable',
    ],
    'Statement'
)

HlSet('PreProc', colors.aqua)
HlLinks(
    [
        'Include',
        'Define',
        'Macro',
        'PreCondit',
        'Structure',
        # ---
        'CocHintSign',
        'ALEInfoSign',
        'GitGutterChange',
        'GitGutterChangeDelete',
        'diffChanged',
        'htmlArg',
        'xmlAttrib',
        'pythonFunction',
        'cssTextProp',
        'cssAnimationProp',
        'cssTransformProp',
        'cssTransitionProp',
        'cssPrintProp',
        'cssBoxProp',
        'cssFontDescriptorProp',
        'cssFlexibleBoxProp',
        'cssBorderOutlineProp',
        'cssBackgroundProp',
        'cssMarginProp',
        'cssListProp',
        'cssTableProp',
        'cssFontProp',
        'cssPaddingProp',
        'cssDimensionProp',
        'cssRenderProp',
        'cssColorProp',
        'cssGeneratedContentProp',
        'javaScriptFunction',
        'jsClassKeyword',
        'jsExtendsKeyword',
        'jsExportDefault',
        'jsTemplateBraces',
        'jsFunction',
        'typeScriptReserved',
        'typeScriptLabel',
        'typeScriptFuncKeyword',
        'typeScriptInterpolationDelimiter',
        'goDirective',
        'luaFunction',
        'luaFunction',
        'markdownCode',
        'markdownCodeBlock',
        'markdownCodeDelimiter',
        'haskellLet',
        'haskellDefault',
        'haskellWhere',
        'haskellBottom',
        'haskellBlockKeywords',
        'haskellImportKeywords',
        'haskellDeclKeyword',
        'haskellDeriving',
        'haskellAssocType',
    ],
    'PreProc'
)

HlSet('Type', colors.yellow)
HlLinks(
    [
        'Typedef',
        'CocWarningSign',
        'ALEWarningSign',
        'diffNewFile',
        'vimCommand',
        'cssFunctionName',
        'cssUIProp',
        'cssPositioningProp',
        'jsClassDefinition',
        'markdownH5',
        'markdownH6',
        'haskellType',
        'tomlTableArray',
    ],
    'Type'
)

HlSet('Special', colors.orange)
HlLinks(
    [
        'StorageClass',
        'SpecialChar',
        'Tag',
        'Delimiter',
        'SpecialComment',
        'Debug',
        'WarningMsg',
        'qfLineNr',
        'diffFile',
        # ---
        'htmlSpecialChar',
        'xmlEntity',
        'xmlEntityPunct',
        'vimNotation',
        'vimBracket',
        'vimMapModKey',
        'cStructure',
        'pythonBuiltin',
        'pythonBuiltinObj',
        'pythonBuiltinFunc',
        'cssIdentifier',
        'typeScriptIdentifier',
        'goBuiltins',
        'luaTable',
        'markdownHeadingDelimiter',
        'haskellBacktick',
        'haskellStatement',
        'haskellConditional',
    ],
    'Special'
)

HlSet('Underlined', colors.blue, v:none, underline)
HlSet('Ignore', '#3c322d')
HlSet('Error', colors.red, v:none, bold_underline)
HlSet('Todo', 'fg', v:none, bold_underline)

HlSet('CursorLine', v:none, colors.cursorlinebg)
HlLinks(['ColorColumn', 'CursorColumn', 'CocMenuSel'], 'CursorLine')

HlSet('Cursor', v:none, v:none, { inverse: 1 })
HlLinks(['lCursor', 'CursorIM'], 'Cursor')

HlSet('Directory', colors.green, v:none, bold)
HlLinks(
    [
        'markdownH1',
        'markdownH2',
        'CocGitAddedSign',
    ],
    'Directory'
)

HlSet('DiffAdd', v:none, '#2b4018')
HlSet('DiffChange', v:none, '#263840')
HlSet('DiffDelete', '#1a1a1a', '#4d2f2b')
HlSet('DiffText', v:none, '#453b24')
HlSet('NonText', '#47423d')
HlLinks(
    [
        'EndOfBuffer',
        'SpecialKey',
        'LineNrAbove',
        'LineNrBelow',
    ],
    'NonText'
)

HlSet('ErrorMsg', colors.red, v:none, bold)
HlLinks(['CocGitRemovedSign', 'CocGitTopRemovedSign'], 'ErrorMsg')

HlSet('VertSplit', colors.black)
HlSet('Folded', colors.gray, '#2b2927')
HlLinks(['FoldColumn'], 'Folded')
HlSet('IncSearch', '#4780f1', v:none, bold_underline)
HlSet('CursorLineNr', colors.yellow, colors.cursorlinebg)
HlSet('MatchParen', '#eb3a75', v:none, bold)
HlSet('ModeMsg', '#93b329', v:none, bold)
HlSet('MoreMsg', colors.yellow, v:none, bold)
HlLinks(
    [
        'markdownH3',
        'markdownH4',
        'svelteRepeat',
        'svelteConditional'
    ],
    'MoreMsg'
)

HlSet('Normal', colors.normal)
HlLinks(
    [
        'CocOutlineName',
        'htmlTagN',
        'vimFuncSID',
        'vimSetSep',
        'vimSep',
        'vimContinue',
        'vimVar',
        'pythonDot',
        'cssVendor',
        'javaScriptBraces',
        'javaScriptParens',
        'jsGlobalNodeObjects',
        'jsGlobalObjects',
        'jsFuncParens',
        'jsParens',
        'typeScriptBraces',
        'typeScriptEndColons',
        'typeScriptDOMObjects',
        'typeScriptAjaxMethods',
        'typeScriptLogicSymbols',
        'typeScriptGlobalObjects',
        'typeScriptParens',
        'typeScriptOpSymbols',
        'typeScriptHtmlElemProperties',
        'markdownUrlDelimiter',
        'markdownLinkDelimiter',
        'markdownLinkTextDelimiter',
        'haskellSeparator',
        'haskellDelimiter',
        'jsonBraces',
        'jsonString',
    ],
    'Normal'
)

HlSet('Pmenu', colors.normal, colors.visual)
HlSet('PmenuSel', colors.visual, colors.blue, bold)
HlSet('Visual', v:none, colors.visual)
HlLinks(['PmenuSbar', 'VisualNOS'], 'Visual')
HlSet('PmenuThumb', v:none, colors.graish)
HlSet('QuickFixLine', v:none, '#37322d')
HlSet('Search', '#1eb81e', v:none, bold_underline)
HlSet('SpellBad', v:none, v:none, underline, colors.redish)
HlSet('SpellCap', v:none, v:none, underline, '#a0b82e')
HlLinks(['SpellLocal', 'SpellRare'], 'SpellCap')
HlSet('StatusLine', '#797065', colors.black)
HlSet('StatusLineNC', '#493c36', colors.black)
HlLinks(['CocListPath'], 'StatusLineNC')
HlSet('StatusLineTerm', colors.green, colors.black, bold)
HlSet('StatusLineTermNC', '#5f6e24', colors.black)
HlSet('TabLine', colors.graish, colors.black)
HlLinks(['TabLineFill'], 'Tabline')
HlSet('TabLineSel', '#74853c', colors.black, bold)
HlSet('Terminal', colors.normal, '#1d1f17')
HlSet('Title', '#855c79', v:none, bold)
HlSet('WildMenu', colors.blue, colors.visual, bold)

HlSet('User1', '#628c4c', colors.black)
HlSet('User2', '#70655c', colors.black, underline, colors.redish)
HlSet('User3', '#a59543', colors.black)
HlSet('User4', '#466d87', colors.black)
HlSet('User5', '#87517f', colors.black)
HlSet('User6', '#964b44', colors.black)
HlSet('User7', '#ca4141', colors.black, bold)
HlSet('HighlightedyankRegion', v:none, '#363d45')

HlSet('SignColumn')
HlSet('qfError')
HlSet('qfFileName')

HlSet('CocHoverRange', v:none, '#2f3829')
HlLinks(['CocCursorRange'], 'CocHoverRange')
HlSet('CocFloating', v:none, '#21261d')
HlSet('CocNotification', v:none, '#1d2326')
HlSet('CocListMode', '#748c20', colors.black, bold)
HlSet('CocErrorHighlight', v:none, v:none, underline, '#d33e2a')
HlSet('CocWarningHighlight', v:none, v:none, underline, '#dea91d')
HlSet('CocInfoHighlight', v:none, v:none, underline, '#9dcc1f')
HlSet('CocHintHighlight', v:none, v:none, underline, '#50bf7b')
HlSet('CocGitChangedSign', v:none, v:none, bold, '#70a17c')
HlLinks(['CocGitChangeRemovedSign'], 'CocGitChangedSign')

HlSet('debugPC', v:none, '#0f1317')
HlSet('debugBreakpoint', colors.red, v:none, { reverse: 1, bold: 1 })
HlLinks(
    [
        'htmlSpecialTagName',
        'docbkKeyword',
    ],
    'htmlTagName'
)

HlSet('htmlLink', colors.bright, v:none, underline)
HlSet('htmlBold', 'fg', v:none, bold)
HlSet('htmlBoldUnderline', 'fg', v:none, bold_underline)
HlSet('htmlBoldItalic', 'fg', v:none, { bold: 1, italic: 1 })
HlSet('htmlBoldUnderlineItalic', 'fg', v:none, { bold: 1, underline: 1, italic: 1 })
HlSet('htmlUnderline', 'fg', v:none, underline)
HlSet('htmlUnderlineItalic', 'fg', v:none, { underline: 1, italic: 1 })
HlSet('htmlItalic', 'fg', v:none, italic)

HlSet('vimCommentTitle', colors.bright, v:none, bold)
HlLinks(['vimSubst'], 'vimFuncName')
HlLinks(['vimCommentString'], 'vimComment')
HlSet('typeScriptDocTags', colors.bright, v:none, bold)

HlSet('markdownItalic', colors.normal, v:none, italic)
HlSet('markdownLinkText', colors.gray, v:none, underline)
HlLinks(['markdownIdDeclaration'], 'markdownLinkText')

# vim: set tw=80 fdm=marker:
