-- Name:         naz.vim
-- Description:
-- Author:       parham.alvani@gmail.com
-- Website:      https://github.com/1995parham/naz.vim

-- setup colorbuddy
local Group = require("colorbuddy.group").Group
local c = require("colorbuddy.color").colors
local g = require("colorbuddy.group").groups
local s = require("colorbuddy.style").styles

local b = s.bold
local i = s.italic
local uc = s.undercurl
local ul = s.underline
local st = s.strikethrough
local r = s.reverse
local no = s.NONE

require("color")

-- used for the columns set with 'colorcolumn'
Group.new("ColorColumn", c.none, c.lightblack, no)
-- placeholder characters substituted for concealed text (see 'conceallevel')
Group.new("Conceal", c.none, c.none, no)
-- the character under the cursor
Group.new("Cursor", c.none, c.none, no)
-- like Cursor, but used when in IME mode
Group.new("CursorIM", c.none, c.none, no)
-- the screen column that the cursor is in when 'cursorcolumn' is set
Group.new("CursorColumn", c.black, c.very_pale_yellow, no)
-- the screen line that the cursor is in when 'cursorline' is set
Group.new("CursorLine", c.black, c.very_pale_yellow, no)
-- directory names (and other special names in listings)
Group.new("Directory", c.orange, c.none, no)
-- diff mode: Added line
Group.new("DiffAdd", c.addfg, c.addbg, no)
-- diff mode: Changed line
Group.new("DiffChange", c.changefg, c.changebg, no)
-- diff mode: Deleted line
Group.new("DiffDelete", c.black, c.delbg, no)
-- diff mode: Changed text within a changed line
Group.new("DiffText", c.black, c.aqua, no)
-- filler lines (~) after the last line in the buffer
Group.new("EndOfBuffer", c.black, c.none.no)
-- error messages on the command line
Group.new("ErrorMsg", c.black, c.red, no)
-- the column separating vertically split windows
Group.new("VertSplit", c.black, c.orange, no)
-- line used for closed folds
Group.new("Folded", c.warmgrey, c.darkgrey, no)
-- 'foldcolumn'
Group.new("FoldColumn", c.none, c.darkgrey, no)
-- column where signs are displayed
Group.new("SignColumn", c.none, c.lightblack, no)
-- 'incsearch' highlighting; also used for the text replaced with ":s///c"
Group.new("IncSearch", c.none, c.none, no)
-- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
Group.new("LineNr", c.springgreen, c.black, no)
-- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
Group.new("CursorLineNr", c.orange, c.lightblack, no)
-- The character under the cursor or just before it, if it is a paired bracket, and its match.
Group.new("MatchParen", c.black, c.lightgrey, no)
-- 'showmode' message (e.g., "-- INSERT --")
Group.new("ModeMsg", c.yellow, c.none, no)
-- more-prompt
Group.new("MoreMsg", c.yellow, c.none, no)
-- '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not
-- really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
Group.new("NonText", c.lightgrey, c.none, no)
-- normal text
Group.new("Normal", c.white, c.black, no)
-- normal floating window
Group.new("NormalFloat", c.white, c.lightgrey)
-- Popup menu: normal item.
Group.new("Pmenu", c.orange, c.black, no)
-- Popup menu: selected item.
Group.new("PmenuSel", c.aqua, c.black, r + b)
-- Popup menu: scrollbar.
Group.new("PmenuSbar", c.none, c.none, no)
-- Popup menu: Thumb of the scrollbar.
Group.new("PmenuThumb", c.lightblack, c.grey, no)
-- hit-enter prompt and yes/no questions
Group.new("Question", c.yellow, c.none, no)
-- Current quickfix item in the quickfix window.
Group.new("QuickFixLine", c.none, c.none, no)
-- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
Group.new("Search", c.black, c.yellow, no)
-- Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'.
-- Generally: text that is displayed differently from what it really is.
Group.new("SpecialKey", c.pink, c.none, no)
-- Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
Group.new("SpellBad", c.very_soft_red, c.none, no)
-- Word that should start with a capital. This will be combined with the highlighting used otherwise.
Group.new("SpellCap", c.very_soft_yellow, c.none, no)
-- Word that is recognized by the spellchecker as one that is used in another region.
-- This will be combined with the highlighting used otherwise.
Group.new("SpellLocal", c.very_soft_yellow, c.none, no)
-- Word that is recognized by the spellchecker as one that is hardly ever used.
-- spell This will be combined with the highlighting used otherwise.
Group.new("SpellRare", c.very_soft_yellow, c.none, no)
-- status line of current window
Group.new("StatusLine", c.none, c.none, no)
-- status lines of not-current windows Note: if this is equal to "StatusLine"
-- Vim will use "^^^" in the status line of the current window.
Group.new("StatusLineNC", c.warmgrey, c.none, no)
-- status line of current :terminal window
Group.new("StatusLineTerm", c.none, c.none, no)
-- status line of non-current :terminal window
Group.new("StatusLineTermNC", c.none, c.none, no)
-- tab pages line, not active tab page label
Group.new("TabLine", c.none, c.none, no)
-- tab pages line, where there are no labels
Group.new("TabLineFill", c.none, c.lightblack, no)
-- tab pages line, active tab page label
Group.new("TabLineSel", c.white, c.none, no)
-- terminal window (see terminal-size-color)
Group.new("Terminal", c.white, c.black, no)
-- titles for output from ":set all", ":autocmd" etc.
Group.new("Title", c.yellow, c.none, no)
-- Visual mode selection when vim is "Not Owning the Selection".
-- Only X11 Gui's gui-x11 and xterm-clipboard supports this.
Group.new("VisualNOS", c.none, c.none, no)
-- Visual mode selection
Group.new("Visual", c.none, c.lightgrey, no)
-- warning messages
Group.new("WarningMsg", c.red, c.none, no)
-- current match in 'wildmenu' completion
Group.new("WildMenu", c.none, c.none, no)

-- any comment
Group.new("Comment", c.grey, c.none, i)
-- any constant
Group.new("Constant", c.purple, c.none, no)
-- string constant: "this is a string"
Group.new("String", c.chartreuse, c.none, no)
-- a character constant: 'c', '\n'
Group.new("Character", c.yellow, c.none, no)
-- a number constant: 234, 0xff
Group.new("Number", c.tomato, c.none, no)
-- a boolean constant: TRUE, false
Group.new("Boolean", c.purple, c.none, no)
-- a floating point constant: 2.3e10
Group.new("Float", c.tomato, c.none, no)
-- any variable name
Group.new("Identifier", c.orange, c.none, no)
-- function name (also: methods for classes)
Group.new("Function", c.blue, c.none, no)
-- any statement
Group.new("Statement", c.pink, c.none, no)
-- if, then, else, endif, switch, etc.
Group.new("Conditional", c.lightorange, c.none, no)
-- for, do, while, etc.
Group.new("Repeat", c.lightorange, c.none, no)
-- case, default, etc.
Group.new("Label", c.very_soft_orange, c.none, no)
-- sizeof", "+", "*", etc.
Group.new("Operator", c.aqua, c.none, no)
-- any other keyword
Group.new("Keyword", c.aqua, c.none, no)
-- try, catch, throw
Group.new("Exception", c.none, c.none, no)
-- generic Preprocessor
Group.new("PreProc", c.coral, c.none, no)
-- preprocessor #include
Group.new("Include", c.pink, c.none, no)
-- preprocessor #define
Group.new("Define", c.pink, c.none, no)
-- same as Define
Group.new("Macro", c.green, c.none, no)
-- preprocessor #if, #else, #endif, etc.
Group.new("PreCondit", c.green, c.none, no)
-- int, long, char, etc.
Group.new("Type", c.lime_green, c.none, i)
-- static, register, volatile, etc.
Group.new("StorageClass", c.darkturquoise, c.none, no)
-- struct, union, enum, etc.
Group.new("Structure", c.aqua, c.none, no)
-- A typedef
Group.new("Typedef", c.aqua, c.none, no)
-- any special symbol
Group.new("Special", c.purple, c.none, no)
-- special character in a constant
Group.new("SpecialChar", c.pink, c.none, no)
-- you can use CTRL-] on this
Group.new("Tag", c.pink, c.none, no)
-- character that needs attention
Group.new("Delimiter", c.pink, c.none, no)
-- special things inside a comment
Group.new("SpecialComment", c.aqua, c.none, no)
-- debugging statements
Group.new("Debug", c.none, c.none, no)
-- text that stands out, HTML links
Group.new("Underlined", c.aqua, c.none, ul)
-- left blank, hidden
Group.new("Ignore", c.none, c.none, no)
-- any erroneous construct
Group.new("Error", c.pink, c.darkred, no)
-- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
Group.new("Todo", c.orange, c.none, b + i)

-- https://github.com/glepnir/dashboard-nvim
Group.new("DashboardHeader", c.orange, c.none, no)
Group.new("DashboardCenter", c.white, c.none, no)
Group.new("DashboardCenterIcon", c.cyan, c.none, no)
Group.new("DashboardShortCut", c.pink, c.none, no)
Group.new("DashboardFooter", c.white, c.none, no)

Group.new("jsonKeyword", c.orange, c.none, no)

Group.new("htmlTag", c.white, c.none, no)
Group.new("htmlEndTag", c.white, c.none, no)
Group.link("htmlTagName", g.Tag)
Group.new("htmlArg", c.orange, c.none, no)
Group.new("htmlSpecialChar", c.purple, c.none, no)

-- for c++/dart attributes, annotations that can be attached to the code to
-- denote some kind of meta information.
Group.new("TSAnnotation", c.none, c.none, no)

Group.new("TSAttribute", c.none, c.none, no)

-- for booleans
Group.link("TSBoolean", g.Boolean)

-- for characters
Group.link("TSCharacter", g.Character)
Group.link("TSCharacterSpecial", g.SpecialChar)

-- for comment block
Group.link("TSComment", g.Comment)

-- for keywords releated to condtionnals
Group.link("TSConditional", g.Conditional)

-- for constants
Group.link("TSConstant", g.Constant)
-- for constants that are built in the language: nil in lua
Group.override("TSConstBuiltin", g.Constant, { style = b + i })
-- for constants that are defined by macros: NULL in c
Group.override("TSConstMacro", g.Macro, { style = b })

-- for constructor call and definitions: {} in lua, and java constructors
Group.new("TSConstructor", c.yellow, c.none, no)

Group.link("TSDebug", g.Debug)
Group.link("TSDefine", g.Define)

-- for syntax/parser errors
Group.link("TSError", g.Error)
-- for exception related keywords
Group.link("TSException", g.Exception)

--  for fields
Group.new("TSField", c.orange, c.none, no)

-- for floats
Group.link("TSFloat", g.Float)

-- for functions (calls and definitions)
Group.link("TSFunction", g.Function)
Group.link("TSFunctionCall", g.Function)
-- for builtin functions: table.insert in lua
Group.new("TSFuncBuiltin", c.camel, c.none, b)
-- for macro defined functions (calls and definitions): each macro_rules in rust
Group.override("TSFuncMacro", g.Macro, { style = i })

-- for includes: #include in C, use or extern crate in rust or require in lua
Group.link("TSInclude", g.Include)

-- for keywords that don't fall in previous categories
Group.link("TSKeyword", g.Keyword)
-- for keywords used to define a function
Group.new("TSKeywordFunction", c.light_blue, c.none, i)
-- for operators that are english words, e.g. and, as, or.
Group.new("TSKeywordOperator", c.coral, c.none, no)
Group.new("TSKeywordReturn", c.pale_orange, c.none, no)

-- for labels: label: in c and :label: in lua
Group.link("TSLabel", g.Label)

-- for method calls and definitions
Group.override("TSMethod", g.Function, { style = i })
Group.override("TSMethodCall", g.Function, { style = i })

-- for identifiers referring to modules and namespaces
Group.new("TSNamespace", c.light_yellow, c.none, no)

-- for no highlighting
Group.new("TSNone", c.none, c.none, no)
-- for all numbers
Group.link("TSNumber", g.Number)

-- for any operator: +, but also -> and * in c
Group.link("TSOperator", g.Operator)

-- for parameters of a function
Group.new("TSParameter", c.pure_pink, c.none, no)
-- for references to parameters of a function
Group.new("TSParameterReference", c.pure_pink, c.none, no)

Group.link("TSPreProc", g.PreProc)

-- same as TSField
Group.new("TSProperty", c.orange, c.none, no)

-- for delimiters ie: .
Group.new("TSPunctDelimiter", c.white, c.none, no)
-- for brackets and parens
Group.new("TSPunctBracket", c.white, c.none, no)
-- for special punctutation that does not fall in the categories before
Group.new("TSPunctSpecial", c.white, c.none, no)

-- for keywords realted to loops
Group.link("TSRepeat", g.Repeat)

Group.link("TSStorageClass", g.StorageClass)

-- for strings
Group.link("TSString", g.String)
-- for regexes
Group.new("TSStringRegex", c.very_light_orange, c.none, no)
-- for escape characters within a string
Group.new("TSStringEscape", c.orange, c.none, no)
Group.new("TSStringSpecial", c.orange, c.none, no)

-- for identifiers referring to symbols or atoms
Group.new("TSSymbol", c.none, c.none, no)

-- tags like html tags
Group.link("TSTag", g.Tag)
Group.new("TSTagAttribute", c.softred)
-- tags delimiter like < > /
Group.link("TSTagDelimiter", g.Delimiter)

-- for strings considered text in a markup language
Group.new("TSText", c.white, c.none, no)
-- for text to be represented in bold.
Group.new("TSStrong", c.white_darker, c.none, b)
-- for text to be represented with emphasis
Group.new("TSEmphasis", c.white, c.none, i)
-- for text to be represented with an underline
Group.new("TSUnderline", c.white, c.none, ul)
-- for strikethrough text
Group.new("TSStrike", c.white, c.none, st)
-- text that is part of a title
Group.new("TSTitle", c.very_light_orange, c.none, b)
-- literal text
Group.new("TSLiteral", c.vivid_orange, c.none, i)
-- any URI like a link or email
Group.new("TSURI", c.lime_green, c.none, uc)
-- for LaTex-like math environments
Group.new("TSMath", c.white, c.none, i)
-- for footnotes, text references, citations
Group.new("TSTextReference", c.orange, c.none, i)
-- for text environments of markup languages
Group.new("TSEnviroment", c.white, c.none, no)
-- for the name/the string indicating the type of text environment
Group.new("TSEnviromentName", c.tomato, c.none, no)

-- text representation of an informational note
Group.new("TSNote", c.white, c.none, no)
-- text representation of a warning note
Group.link("TSWarning", g.WarningMsg)
-- text representation of a danger note
Group.override("TSDanger", g.Error, { style = b })

-- for types
Group.override("TSType", g.Type, { style = i })
-- For builtin types
Group.link("TSTypeBuiltin", g.Type)
Group.link("TSTypeQualifier", g.Type)
Group.link("TSTypeDefinition", g.Type)

-- any variable name that does not have another highlight
Group.new("TSVariable", c.vivid_orange, c.none, no)
-- variable names that are defined by the languages, like `this` or `self`
Group.new("TSVariableBuiltin", c.camel, c.none, b)
