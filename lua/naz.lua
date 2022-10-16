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
Group.new("@annotation", c.none, c.none, no)

Group.new("@attribute", c.none, c.none, no)

-- for booleans
Group.link("@boolean", g.Boolean)

-- for characters
Group.link("@character", g.Character)
Group.link("@character.special", g.SpecialChar)

-- for comment block
Group.link("@comment", g.Comment)

-- for keywords releated to condtionnals
Group.link("@conditional", g.Conditional)

-- for constants
Group.link("@constant", g.Constant)
-- for constants that are built in the language: nil in lua
Group.override("@constant.builtin", g.Constant, { style = b + i })
-- for constants that are defined by macros: NULL in c
Group.override("@constant.macro", g.Macro, { style = b })

-- for construcztor call and definitions: {} in lua, and java constructors
Group.new("@constructor", c.yellow, c.none, no)

Group.link("@debug", g.Debug)
Group.link("@define", g.Define)

-- for syntax/parser errors
Group.link("@error", g.Error)
-- for exception related keywords
Group.link("@exception", g.Exception)

--  for fields
Group.new("@field", c.orange, c.none, no)

-- for floats
Group.link("@float", g.Float)

-- for functions (calls and definitions)
Group.link("@function", g.Function)
Group.link("@function.call", g.Function)
-- for builtin functions: table.insert in lua
Group.new("@function.builtin", c.camel, c.none, b)
-- for macro defined functions (calls and definitions): each macro_rules in rust
Group.override("@function.macro", g.Macro, { style = i })

-- for includes: #include in C, use or extern crate in rust or require in lua
Group.link("@include", g.Include)

-- for keywords that don't fall in previous categories
Group.link("@keyword", g.Keyword)
-- for keywords used to define a function
Group.new("@keyword.function", c.light_blue, c.none, i)
-- for operators that are english words, e.g. and, as, or.
Group.new("@keyword.operator", c.coral, c.none, no)
Group.new("@keyword.return", c.pale_orange, c.none, no)

-- for labels: label: in c and :label: in lua
Group.link("@label", g.Label)

-- for method calls and definitions
Group.override("@method", g.Function, { style = i })
Group.override("@method.call", g.Function, { style = i })

-- for identifiers referring to modules and namespaces
Group.new("@namespace", c.light_yellow, c.none, no)

-- for no highlighting
Group.new("@none", c.none, c.none, no)
-- for all numbers
Group.link("@number", g.Number)

-- for any operator: +, but also -> and * in c
Group.link("@operator", g.Operator)

-- for parameters of a function
Group.new("@parameter", c.pure_pink, c.none, no)
-- for references to parameters of a function
Group.new("@parameter.reference", c.pure_pink, c.none, no)

Group.link("@preproc", g.PreProc)

-- same as TSField
Group.new("@property", c.orange, c.none, no)

-- for delimiters ie: .
Group.new("@punctuation.delimiter", c.white, c.none, no)
-- for brackets and parens
Group.new("@punctuation.bracket", c.white, c.none, no)
-- for special punctutation that does not fall in the categories before
Group.new("@punctuation.special", c.white, c.none, no)

-- for keywords realted to loops
Group.link("@repeat", g.Repeat)

Group.link("@storageclass", g.StorageClass)

-- for strings
Group.link("@string", g.String)
-- for regexes
Group.new("@string.regex", c.very_light_orange, c.none, no)
-- for escape characters within a string
Group.new("@string.escape", c.orange, c.none, no)
Group.new("@string.special", c.orange, c.none, no)

-- for identifiers referring to symbols or atoms
Group.new("@symbol", c.none, c.none, no)

-- tags like html tags
Group.link("@tag", g.Tag)
Group.new("@tag.attribute", c.softred)
-- tags delimiter like < > /
Group.link("@tag.delimiter", g.Delimiter)

-- for strings considered text in a markup language
Group.new("@text", c.white, c.none, no)
-- for text to be represented in bold.
Group.new("@text.strong", c.white_darker, c.none, b)
-- for text to be represented with emphasis
Group.new("@text.emphasis", c.white, c.none, i)
-- for text to be represented with an underline
Group.new("@text.underline", c.white, c.none, ul)
-- for strikethrough text
Group.new("@text.strike", c.white, c.none, st)
-- text that is part of a title
Group.new("@text.title", c.very_light_orange, c.none, b)
-- literal text
Group.new("@text.literal", c.vivid_orange, c.none, i)
-- any URI like a link or email
Group.new("@text.uri", c.lime_green, c.none, uc)
-- for LaTex-like math environments
Group.new("@text.math", c.white, c.none, i)
-- for footnotes, text references, citations
Group.new("@text.reference", c.orange, c.none, i)
-- for text environments of markup languages
Group.new("@text.enviroment", c.white, c.none, no)
-- for the name/the string indicating the type of text environment
Group.new("@text.enviroment.name", c.tomato, c.none, no)

-- text representation of an informational note
Group.new("@text.note", c.white, c.none, no)
-- text representation of a warning note
Group.link("@text.warning", g.WarningMsg)
-- text representation of a danger note
Group.override("@text.danger", g.Error, { style = b })

-- for types
Group.override("@type", g.Type, { style = i })
-- For builtin types
Group.link("@type.builtin", g.Type)
Group.link("@type.qualifier", g.Type)
Group.link("@type.definition", g.Type)

-- any variable name that does not have another highlight
Group.new("@variable", c.vivid_orange, c.none, no)
-- variable names that are defined by the languages, like `this` or `self`
Group.new("@variable.builtin", c.camel, c.none, b)

Group.new("CmpItemAbbrDeprecated", c.grey, c.none, st)
Group.new("CmpItemAbbrMatch", c.lime_green, c.none)
Group.new("CmpItemAbbrMatchFuzzy", c.lime_green, c.none)

Group.new("CmpItemKindVariable", c.light_blue, c.none)
Group.new("CmpItemKindInterface", c.light_blue, c.none)
Group.new("CmpItemKindText", c.softred, c.none)
Group.new("CmpItemKindFunction", c.pink, c.none)
Group.new("CmpItemKindMethod", c.pink, c.none)
Group.new("CmpItemKindKeyword", c.vivid_orange, c.none)
Group.new("CmpItemKindProperty", c.vivid_orange, c.none)
Group.new("CmpItemKindUnit", c.vivid_orange, c.none)
