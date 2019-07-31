" In The Name Of God
" Tomorrow Night 24bit Color Theme
" Last Change:	2019-Jul-30
" Maintainer:	Parham Alvani <parham.alvani@gmail.com>


" Initialization {{{
" --------------

if !has('gui_running') && &t_Co < 256
	finish
endif

if !exists('g:velenjak_gui_italic')
	let g:velenjak_gui_italic = 1
endif

if !exists('g:velenjak_term_italic')
	let g:velenjak_term_italic = 0
endif

set background=dark
highlight clear

if exists('syntax_on')
	syntax reset
endif

let g:colors_name = 'velenjak'

" }}}

" Helper Functions {{{
" ----------------

" Returns an approximate grey index for the given grey level
function s:grey_number(x)
	if a:x < 14
		return 0
	else
		let l:n = (a:x - 8) / 10
		let l:m = (a:x - 8) % 10
		if l:m < 5
			return l:n
		else
			return l:n + 1
		endif
	endif
endfunction

" Returns the actual grey level represented by the grey index
function s:grey_level(n)
	if a:n == 0
		return 0
	else
		return 8 + (a:n * 10)
	endif
endfun

" Returns the palette index for the given grey index
function s:grey_colour(n)
	if a:n == 0
		return 16
	elseif a:n == 25
		return 231
	else
		return 231 + a:n
	endif
endfunction

" Returns an approximate colour index for the given colour level
function s:rgb_number(x)
	if a:x < 75
		return 0
	else
		let l:n = (a:x - 55) / 40
		let l:m = (a:x - 55) % 40
		if l:m < 20
			return l:n
		else
			return l:n + 1
		endif
	endif
endfunction

" Returns the actual colour level for the given colour index
function s:rgb_level(n)
	if a:n == 0
		return 0
	else
		return 55 + (a:n * 40)
	endif
endfunction

" Returns the palette index for the given R/G/B colour indices
function s:rgb_colour(x, y, z)
	return 16 + (a:x * 36) + (a:y * 6) + a:z
endfunction


" Returns the palette index to approximate the given R/G/B colour levels
function s:colour(r, g, b)
	" Get the closest grey
	let l:gx = s:grey_number(a:r)
	let l:gy = s:grey_number(a:g)
	let l:gz = s:grey_number(a:b)

	" Get the closest colour
	let l:x = s:rgb_number(a:r)
	let l:y = s:rgb_number(a:g)
	let l:z = s:rgb_number(a:b)

	if l:gx == l:gy && l:gy == l:gz
		" There are two possibilities
		let l:dgr = s:grey_level(l:gx) - a:r
		let l:dgg = s:grey_level(l:gy) - a:g
		let l:dgb = s:grey_level(l:gz) - a:b
		let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
		let l:dr = s:rgb_level(l:gx) - a:r
		let l:dg = s:rgb_level(l:gy) - a:g
		let l:db = s:rgb_level(l:gz) - a:b
		let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
		if l:dgrey < l:drgb
			" Use the grey
			return s:grey_colour(l:gx)
		else
			" Use the colour
			return s:rgb_colour(l:x, l:y, l:z)
		endif
	else
		" Only one possibility
		return s:rgb_colour(l:x, l:y, l:z)
	endif
endfunction

" Returns the palette index to approximate the 'rrggbb' hex string
function s:rgb(rgb)
	let l:rgb = strpart(a:rgb, 1, 6)
	let l:r = ('0x' . strpart(l:rgb, 0, 2)) + 0
	let l:g = ('0x' . strpart(l:rgb, 2, 2)) + 0
	let l:b = ('0x' . strpart(l:rgb, 4, 2)) + 0

	return s:colour(l:r, l:g, l:b)
endfunction

function! s:h(group, style)
	let s:ctermformat = 'NONE'
	let s:guiformat = 'NONE'
	if has_key(a:style, 'format')
		let s:ctermformat = a:style.format
		let s:guiformat = a:style.format
	endif
	if g:velenjak_term_italic == 0
		let s:ctermformat = substitute(s:ctermformat, ',italic', '', '')
		let s:ctermformat = substitute(s:ctermformat, 'italic,', '', '')
		let s:ctermformat = substitute(s:ctermformat, 'italic', '', '')
	endif
	if g:velenjak_gui_italic == 0
		let s:guiformat = substitute(s:guiformat, ',italic', '', '')
		let s:guiformat = substitute(s:guiformat, 'italic,', '', '')
		let s:guiformat = substitute(s:guiformat, 'italic', '', '')
	endif
	execute 'highlight' a:group
				\ 'guifg='   .(has_key(a:style, 'fg')      ? a:style.fg   : 'NONE')
				\ 'guibg='   .(has_key(a:style, 'bg')      ? a:style.bg   : 'NONE')
				\ 'guisp='   .(has_key(a:style, 'sp')      ? a:style.sp   : 'NONE')
				\ 'gui='     .(!empty(s:guiformat) ? s:guiformat   : 'NONE')
				\ 'ctermfg=' .(has_key(a:style, 'fg')      ? s:rgb(a:style.fg)   : 'NONE')
				\ 'ctermbg=' .(has_key(a:style, 'bg')      ? s:rgb(a:style.bg)   : 'NONE')
				\ 'cterm='   .(!empty(s:ctermformat) ? s:ctermformat   : 'NONE')

endfunction

" }}}

" Palettes {{{
" --------

let s:white       = '#E8E8E3'
let s:black       = '#2F2F2F'
let s:lightblack  = '#2D2E27'
let s:lightblack2 = '#383A3E'
let s:darkblack   = '#211F1C'
let s:grey        = '#8F908A'
let s:lightgrey   = '#575b61'
let s:darkgrey    = '#3c3c3c'
let s:warmgrey    = '#907d57'

let s:pink        = '#F92772'
let s:green       = '#8ad000'
let s:springgreen = '#00ff7f'
let s:aqua        = '#66D9EF'
let s:yellow      = '#E6DB74'
let s:orange      = '#FD9720'
let s:sienna1     = '#ff8247'
let s:tomato1     = '#ff6347'
let s:purple      = '#EE82EE'
let s:chartreuse  = '#7fff00'
let s:red         = '#e73c50'
let s:blue        = '#198CFF'
let s:darkred     = '#5f0000'

let s:addfg       = '#d7ffaf'
let s:addbg       = '#5f875f'
let s:delbg       = '#f75f5f'
let s:changefg    = '#d7d7ff'
let s:changebg    = '#5f5f87'

" }}}

" Highlighting Groups (descriptions and ordering from `:h highlight-groups`) {{{
" -------------------------------------------------------------------------

" used for the columns set with 'colorcolumn'
call s:h('ColorColumn',      { 'bg': s:lightblack })
" placeholder characters substituted for concealed text (see 'conceallevel')
call s:h('Conceal',          { })
" the character under the cursor
call s:h('Cursor',           { })
" like Cursor, but used when in IME mode
call s:h('CursorIM',         { })
" the screen column that the cursor is in when 'cursorcolumn' is set
call s:h('CursorColumn',     { 'bg': s:lightblack2 })
" the screen line that the cursor is in when 'cursorline' is set
call s:h('CursorLine',       { 'bg': s:lightblack2 })
" directory names (and other special names in listings)
call s:h('Directory',        { 'fg': s:orange })
" diff mode: Added line
call s:h('DiffAdd',          { 'fg': s:addfg,       'bg': s:addbg })
" diff mode: Changed line
call s:h('DiffChange',       { 'fg': s:changefg,    'bg': s:changebg })
" diff mode: Deleted line
call s:h('DiffDelete',       { 'fg': s:black,       'bg': s:delbg })
" diff mode: Changed text within a changed line
call s:h('DiffText',         { 'fg': s:black,       'bg': s:aqua })
" filler lines (~) after the last line in the buffer
call s:h('EndOfBuffer',      { 'fg': s:black })
" error messages on the command line
call s:h('ErrorMsg',         { 'fg': s:black,       'bg': s:red,   'format': 'standout' })
" the column separating vertically split windows
call s:h('VertSplit',        { 'fg': s:darkgrey,    'bg': s:darkblack })
" line used for closed folds
call s:h('Folded',           { 'fg': s:warmgrey,    'bg': s:darkgrey })
" 'foldcolumn'
call s:h('FoldColumn',       { 'bg': s:darkgrey })
" column where signs are displayed
call s:h('SignColumn',       { 'bg': s:lightblack })
" 'incsearch' highlighting; also used for the text replaced with ":s///c"
call s:h('IncSearch',        { })
" Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
call s:h('LineNr',           { 'fg': s:springgreen, 'bg': s:black })
" Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
call s:h('CursorLineNr',     { 'fg': s:orange,      'bg': s:lightblack })
" The character under the cursor or just before it, if it is a paired bracket, and its match.
call s:h('MatchParen',       { 'fg': s:black,       'bg': s:lightgrey })
" 'showmode' message (e.g., "-- INSERT --")
call s:h('ModeMsg',          { 'fg': s:yellow })
" more-prompt
call s:h('MoreMsg',          { 'fg': s:yellow })
" '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
call s:h('NonText',          { 'fg': s:lightgrey })
" normal text
call s:h('Normal',           { 'fg': s:white,       'bg': s:black })
" Popup menu: normal item.
call s:h('Pmenu',            { 'fg': s:orange,      'bg': s:black })
" Popup menu: selected item.
call s:h('PmenuSel',         { 'fg': s:aqua,        'bg': s:black, 'format': 'reverse,bold' })
" Popup menu: scrollbar.
call s:h('PmenuSbar',        { })
" Popup menu: Thumb of the scrollbar.
call s:h('PmenuThumb',       { 'fg': s:lightblack,  'bg': s:grey })
" hit-enter prompt and yes/no questions
call s:h('Question',         { 'fg': s:yellow })
" Current quickfix item in the quickfix window.
call s:h('QuickFixLine',     { })
" Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
call s:h('Search',           { 'fg': s:black,       'bg': s:yellow })
" Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
call s:h('SpecialKey',       { 'fg': s:pink })
" Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
call s:h('SpellBad',         { 'fg': '#F0B5C3' })
" Word that should start with a capital. This will be combined with the highlighting used otherwise.
call s:h('SpellCap',         { 'fg': '#F0E2B5' })
" Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
call s:h('SpellLocal',       { 'fg': '#F0E2B5' })
" Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
call s:h('SpellRare',        { 'fg': '#F0E2B5' })
" status line of current window
call s:h('StatusLine',       { })
" status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
call s:h('StatusLineNC',     { })
" status line of current :terminal window
call s:h('StatusLineTerm',   { })
" status line of non-current :terminal window
call s:h('StatusLineTermNC', { })
" tab pages line, not active tab page label
call s:h('TabLine',          { })
" tab pages line, where there are no labels
call s:h('TabLineFill',      { })
" tab pages line, active tab page label
call s:h('TabLineSel',       { 'fg': s:white })
" terminal window (see terminal-size-color)
call s:h('Terminal',         { 'fg': s:white, 'bg': s:black })
" titles for output from ":set all", ":autocmd" etc.
call s:h('Title',            { 'fg': s:yellow })
" Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
call s:h('VisualNOS',        { })
" Visual mode selection
call s:h('Visual',           { 'bg': s:lightgrey })
" warning messages
call s:h('WarningMsg',       { 'fg': s:red })
" current match in 'wildmenu' completion
call s:h('WildMenu',         { })

" }}}

" Syntax Groups (descriptions and ordering from `:h w18`) {{{
" -------------------------------------------------------

call s:h('Constant',       { 'fg': s:purple })
call s:h('Number',         { 'fg': s:tomato1 })
call s:h('Float',          { 'fg': s:tomato1 })
call s:h('Boolean',        { 'fg': s:purple })
call s:h('Character',      { 'fg': s:yellow })
call s:h('String',         { 'fg': s:chartreuse })

call s:h('Type',           { 'fg': s:aqua })
call s:h('Structure',      { 'fg': s:aqua })
call s:h('StorageClass',   { 'fg': '#00CED1' })
call s:h('Typedef',        { 'fg': s:aqua })

call s:h('Identifier',     { 'fg': s:orange })
call s:h('Function',       { 'fg': s:blue })

call s:h('Statement',      { 'fg': s:pink })
call s:h('Operator',       { 'fg': s:aqua })
call s:h('Label',          { 'fg': s:pink })
call s:h('Keyword',        { 'fg': s:aqua })
"        Conditional"
"        Repeat"
"        Exception"

call s:h('PreProc',        { 'fg': '#ff7f50' })
call s:h('Include',        { 'fg': s:pink })
call s:h('Define',         { 'fg': s:pink })
call s:h('Macro',          { 'fg': s:green })
call s:h('PreCondit',      { 'fg': s:green })

call s:h('Special',        { 'fg': s:purple })
call s:h('SpecialChar',    { 'fg': s:pink })
call s:h('Delimiter',      { 'fg': s:pink })
call s:h('SpecialComment', { 'fg': s:aqua })
call s:h('Tag',            { 'fg': s:pink })
"        Debug"

call s:h('Todo',           { 'fg': s:orange, 'format': 'bold,italic' })
call s:h('Comment',        { 'fg': s:grey,   'format': 'italic' })

call s:h('Ignore',         { })
call s:h('Error',          { 'fg': s:pink,   'bg': s:darkred })

" }}}

" Plugin Highlighting {{{
" -------------------

" scrooloose/nerdtree

call s:h('NERDTreeOpenable',        { 'fg': s:yellow })
call s:h('NERDTreeClosable',        { 'fg': s:yellow })
call s:h('NERDTreeHelp',            { 'fg': s:yellow })
call s:h('NERDTreeBookmarksHeader', { 'fg': s:pink })
call s:h('NERDTreeBookmarksLeader', { 'fg': s:black })
call s:h('NERDTreeBookmarkName',    { 'fg': s:yellow })
call s:h('NERDTreeCWD',             { 'fg': s:orange })
call s:h('NERDTreeUp',              { 'fg': s:white })
call s:h('NERDTreeDirSlash',        { 'fg': '#EF7C66' })
call s:h('NERDTreeDir',             { 'fg': s:aqua })

" dense-analysis/ale

call s:h('ALEWarningSign', { 'fg': s:lightblack, 'bg': s:orange })
call s:h('ALEErrorSign',   { 'fg': s:lightblack, 'bg': s:pink })

" }}}

" Language-Specific Syntax Highlighting {{{
" -------------------------------------

" Vim command
call s:h('vimCommand',           { 'fg': s:pink })

" c
call s:h('cType',                { 'fg': s:yellow })
call s:h('cStorageClass',        { 'fg': '#FF7373' })
call s:h('cConditional',         { 'fg': '#00FF00' })
call s:h('cRepeat',              { 'fg': '#00FF00' })

" cpp
call s:h('cCustomClass',         { 'fg': '#FFDB1A' })

" nasm
call s:h('nasmGen08Register',    { 'fg': '#98F5FF' })
call s:h('nasmGen16Register',    { 'fg': '#98F5FF' })
call s:h('nasmGen32Register',    { 'fg': '#98F5FF' })
call s:h('nasmGen64Register',    { 'fg': '#98F5FF' })
call s:h('nasmSegRegister',      { 'fg': '#53868B' })

" python
call s:h('pythonInclude',        { 'fg': s:purple })
call s:h('pythonStatement',      { 'fg': s:orange })
call s:h('pythonConditional',    { 'fg': s:purple })
call s:h('pythonException',      { 'fg': s:red })
call s:h('pythonFunction',       { 'fg': s:blue })
call s:h('pythonRepeat',         { 'fg': s:aqua })
call s:h('pythonExClass',        { 'fg': s:yellow })
call s:h('pythonBuiltinFunc',    { 'fg': '#FFC125' })
call s:h('pythonOperator',       { 'fg': '#f5deb3' })
call s:h('pythonBoolean',        { 'fg': '#FF4444' })

" javascript
call s:h('jsFuncName',           { 'fg': s:blue })
call s:h('jsThis',               { 'fg': s:pink })
call s:h('jsSuper',              { 'fg': s:pink })
call s:h('jsFunctionKey',        { 'fg': s:blue })
call s:h('jsPrototype',          { 'fg': s:pink })
call s:h('jsExceptions',         { 'fg': s:red })
call s:h('jsFutureKeys',         { 'fg': s:aqua })
call s:h('jsClassDefinition',    { 'fg': s:orange })
call s:h('jsBuiltins',           { 'fg': s:aqua })
call s:h('jsArgsObj',            { 'fg': s:aqua })
call s:h('jsClassMethodType',    { 'fg': '#f5deb3' })
call s:h('jsObjectKey',          { 'fg': '#ffd39b' })
call s:h('jsFuncArgs',           { 'fg': s:orange, 'format': 'italic' })
call s:h('jsStorageClass',       { 'fg': s:aqua })

" html
call s:h('htmlTag',              { 'fg': s:white })
call s:h('htmlEndTag',           { 'fg': s:white })
call s:h('htmlTagName',          { 'fg': s:pink })
call s:h('htmlArg',              { 'fg': s:orange })
call s:h('htmlSpecialChar',      { 'fg': s:purple })

" go
call s:h('goDirective',          { 'fg': s:purple })
call s:h('goDeclaration',        { 'fg': s:purple })
call s:h('goStatement',          { 'fg': s:purple })
call s:h('goConditional',        { 'fg': s:purple })
call s:h('goConstants',          { 'fg': s:orange })
call s:h('goTodo',               { 'fg': s:yellow })
call s:h('goDeclType',           { 'fg': s:green })
call s:h('goBuiltins',           { 'fg': '#00BFFF' })
call s:h('goStruct',             { 'fg': '#FF531A' })
call s:h('goStructDef',          { 'fg': '#FF531A' })
call s:h('goMethod',             { 'fg': '#CCFF00' })
call s:h('goVarDefs',            { 'fg': '#FF6117' })
call s:h('goTypeName',           { 'fg': '#9FFFC2' })
call s:h('goReceiverType',       { 'fg': '#9FFFC2' })
call s:h('goTypeConstructor',    { 'fg': '#9FFFC2' })

" erlang
call s:h('erlangGlobalFuncCall', { 'fg': '#CCFF00' })
call s:h('erlangGlobalFuncRef',  { 'fg': '#CCFF00' })
call s:h('erlangLocalFuncCall',  { 'fg': '#3399FF' })
call s:h('erlangLocalFuncRef',   { 'fg': '#3399FF' })
call s:h('erlangAtom',           { 'fg': '#FF9933' })

" git
call s:h('diffAdded',            { 'fg': s:green })
call s:h('diffRemoved',          { 'fg': s:red })
call s:h('diffCommitSummary',    { 'format': 'bold' })

" json
call s:h('jsonKeyword',          { 'fg': s:orange })
call s:h('jsonBraces',           { 'fg': '#2ABDDC' })

" }}}