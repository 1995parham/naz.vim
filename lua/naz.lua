-- Name:         naz.vim
-- Description:  
-- Author:       parham.alvani@gmail.com
-- Website:      https://github.com/1995parham/naz.vim

-- setup colorbuddy
local Group = require('colorbuddy.group').Group
local c = require('colorbuddy.color').colors
local g = require('colorbuddy.group').groups
local s = require('colorbuddy.style').styles

local b = s.bold
local i = s.italic
local uc = s.undercurl
local ul = s.underline
local r = s.reverse
local no = s.NONE
local global = vim.g

require('color')

-- used for the columns set with 'colorcolumn'
Group.new('ColorColumn', c.none, c.lightblack, no)
-- placeholder characters substituted for concealed text (see 'conceallevel')
Group.new('Conceal', c.none, c.none, no)
-- the character under the cursor
Group.new('Cursor', c.none, c.none, no)
-- like Cursor, but used when in IME mode
Group.new('CursorIM', c.none, c.none, no)
-- the screen column that the cursor is in when 'cursorcolumn' is set
Group.new('CursorColumn', c.none, c.lightblack2, no)
-- the screen line that the cursor is in when 'cursorline' is set
Group.new('CursorLine', c.none, c.lightblack2, no)
-- directory names (and other special names in listings)
Group.new('Directory', c.orange, c.none, no)
-- diff mode: Added line
Group.new('DiffAdd', c.addfg, c.addbg, no)
-- diff mode: Changed line
Group.new('DiffChange', c.changefg, c.changebg, no)
-- diff mode: Deleted line
Group.new('DiffDelete', c.black, c.delbg, no)
-- diff mode: Changed text within a changed line
Group.new('DiffText', c.black, c.aqua, no)
-- filler lines (~) after the last line in the buffer
Group.new('EndOfBuffer', c.black, c.none. no)
-- error messages on the command line
Group.new('ErrorMsg', c.black, c.red, no)
-- the column separating vertically split windows
Group.new('VertSplit', c.black, c.orange, no)
-- line used for closed folds
Group.new('Folded', c.warmgrey, c.darkgrey, no)
-- 'foldcolumn'
Group.new('FoldColumn', c.none, c.darkgrey, no)
-- column where signs are displayed
Group.new('SignColumn', c.none, c.lightblack, no)
-- 'incsearch' highlighting; also used for the text replaced with ":s///c"
Group.new('IncSearch', c.none, c.none, no)
-- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
Group.new('LineNr', c.springgreen, c.black, no)
-- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
Group.new('CursorLineNr', c.orange,  c.lightblack, no)
-- The character under the cursor or just before it, if it is a paired bracket, and its match.
Group.new('MatchParen', c.black, c.lightgrey, no)
-- 'showmode' message (e.g., "-- INSERT --")
Group.new('ModeMsg', c.yellow, c.none, no)
-- more-prompt
Group.new('MoreMsg', c.yellow, c.none, no)
-- '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
Group.new('NonText', c.lightgrey, c.none, no)
-- normal text
Group.new('Normal', c.white, c.black, no)
-- Popup menu: normal item.
Group.new('Pmenu', c.orange, c.black, no)
-- Popup menu: selected item.
Group.new('PmenuSel', c.aqua, c.black, r + b)
-- Popup menu: scrollbar.
Group.new('PmenuSbar', c.none, c.none, no)
-- Popup menu: Thumb of the scrollbar.
Group.new('PmenuThumb', c.lightblack, c.grey, no)
-- hit-enter prompt and yes/no questions
Group.new('Question', c.yellow, c.none, no)
-- Current quickfix item in the quickfix window.
Group.new('QuickFixLine', c.none, c.none, no)
-- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
Group.new('Search', c.black, c.yellow, no)
-- Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
Group.new('SpecialKey', c.pink, c.none, no)
-- Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
Group.new('SpellBad', c.very_soft_red, c.none, no)
-- Word that should start with a capital. This will be combined with the highlighting used otherwise.
Group.new('SpellCap', c.very_soft_yellow, c.none, no)
-- Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
Group.new('SpellLocal', c.very_soft_yellow, c.none, no)
-- Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
Group.new('SpellRare', c.very_soft_yellow, c.none, no)
-- status line of current window
Group.new('StatusLine', c.none, c.none, no)
-- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
Group.new('StatusLineNC', c.warmgrey, c.none, no)
-- status line of current :terminal window
Group.new('StatusLineTerm', c.none, c.none, no)
-- status line of non-current :terminal window
Group.new('StatusLineTermNC', c.none, c.none, no)
-- tab pages line, not active tab page label
Group.new('TabLine', c.none, c.none, no)
-- tab pages line, where there are no labels
Group.new('TabLineFill', c.none, c.none, no)
-- tab pages line, active tab page label
Group.new('TabLineSel', c.white, c.none, no)
-- terminal window (see terminal-size-color)
Group.new('Terminal', c.white, c.black, no)
-- titles for output from ":set all", ":autocmd" etc.
Group.new('Title', c.yellow, c.none, no)
-- Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
Group.new('VisualNOS', c.none, c.none, no)
-- Visual mode selection
Group.new('Visual', c.none, c.lightgrey, no)
-- warning messages
Group.new('WarningMsg', c.red, c.none, no)
-- current match in 'wildmenu' completion
Group.new('WildMenu', c.none, c.none, no)
