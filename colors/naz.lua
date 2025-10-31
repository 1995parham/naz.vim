-- Name:         naz.vim
-- Description:  A warm and cute Neovim colorscheme based on tomorrow night
-- Author:       parham.alvani@gmail.com
-- Website:      https://github.com/1995parham/naz.vim

-- Reset all existing highlights to defaults
vim.cmd('highlight clear')

-- Reset syntax highlighting if it exists
if vim.fn.exists('syntax_on') then
  vim.cmd('syntax reset')
end

-- Set background type
vim.o.background = 'dark'

-- Set the colorscheme name (required for :colorscheme to work)
vim.g.colors_name = 'naz'

-- Enable 24-bit RGB colors in TUI
vim.o.termguicolors = true

-- Color palette
local colors = {
  white = "#F5F5F0",
  white_darker = "#D0D0D0",
  black = "#323232",
  lightblack = "#3A3A35",
  very_pale_yellow = "#ffffdd",
  darkblack = "#282826",
  grey = "#A8A8A0",
  lightgrey = "#707080",
  darkgrey = "#4A4A4A",
  warmgrey = "#B09070",

  pink = "#FF69B4",
  green = "#A0E000",
  springgreen = "#20FFA0",
  aqua = "#80E5FF",
  yellow = "#F0E890",
  orange = "#FFB040",
  lightorange = "#FFB070",
  tomato = "#FF8070",
  purple = "#F0A0F0",
  chartreuse = "#A0FF40",
  red = "#FF5070",
  blue = "#40D0FF",
  vivid_blue = "#50A8FF",
  light_blue = "#60D8FF",
  darkred = "#8F0000",
  darkturquoise = "#40E8E8",
  coral = "#FF9870",
  softred = "#FF9888",
  vivid_yellow = "#FFE040",
  light_yellow = "#FFFF88",
  very_light_orange = "#FFE0A0",
  very_soft_orange = "#FFE0B8",
  vivid_orange = "#FFD850",
  lime_green = "#B8FFD0",
  light_green = "#D8FF88",
  camel = "#D8B088",
  crimson = "#FF3050",
  very_soft_yellow = "#FFF0D0",
  very_soft_red = "#FFD0D8",
  pure_pink = "#FF40A0",
  pale_orange = "#FFE8D0",
  tea_green = "#E0FFD8",

  addfg = "#D7FFAF",
  addbg = "#5F875F",
  delbg = "#F75F5F",
  changefg = "#D7D7FF",
  changebg = "#5F5F87",
}

-- Helper function to set highlights
local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor UI Highlights
hl('ColorColumn', { bg = colors.lightblack })
hl('Conceal', { fg = colors.lightgrey, bg = colors.darkgrey })
hl('Cursor', { fg = colors.black, bg = colors.white })
hl('CursorIM', { fg = colors.black, bg = colors.purple })
hl('CursorColumn', { fg = colors.black, bg = colors.very_pale_yellow })
hl('CursorLine', { fg = colors.black, bg = colors.very_pale_yellow })
hl('Directory', { fg = colors.orange })
hl('DiffAdd', { fg = colors.addfg, bg = colors.addbg })
hl('DiffChange', { fg = colors.changefg, bg = colors.changebg })
hl('DiffDelete', { fg = colors.black, bg = colors.delbg })
hl('DiffText', { fg = colors.black, bg = colors.aqua })
hl('EndOfBuffer', { fg = colors.black })
hl('ErrorMsg', { fg = colors.black, bg = colors.red })
hl('VertSplit', { fg = colors.black, bg = colors.orange })
hl('Folded', { fg = colors.warmgrey, bg = colors.darkgrey })
hl('FoldColumn', { bg = colors.darkgrey })
hl('SignColumn', { bg = colors.lightblack })
hl('IncSearch', { fg = colors.black, bg = colors.vivid_yellow, bold = true })
hl('LineNr', { fg = colors.springgreen, bg = colors.black })
hl('CursorLineNr', { fg = colors.orange, bg = colors.lightblack })
hl('MatchParen', { fg = colors.black, bg = colors.lightgrey })
hl('ModeMsg', { fg = colors.yellow })
hl('MoreMsg', { fg = colors.yellow })
hl('NonText', { fg = colors.lightgrey })
hl('Normal', { fg = colors.white, bg = colors.black })
hl('NormalFloat', { fg = colors.white })
hl('FloatTitle', { fg = colors.white, bold = true })
hl('FloatFooter', { fg = colors.white, bold = true })
hl('FloatBorder', { fg = colors.white })
hl('Pmenu', { fg = colors.orange, bg = colors.black })
hl('PmenuSel', { fg = colors.aqua, bg = colors.black, reverse = true, bold = true })
hl('PmenuSbar', { bg = colors.darkgrey })
hl('PmenuThumb', { fg = colors.lightblack, bg = colors.grey })
hl('Question', { fg = colors.yellow })
hl('QuickFixLine', { bg = colors.lightblack, bold = true })
hl('Search', { fg = colors.black, bg = colors.yellow })
hl('SpecialKey', { fg = colors.pink })
hl('SpellBad', { fg = colors.very_soft_red })
hl('SpellCap', { fg = colors.very_soft_yellow })
hl('SpellLocal', { fg = colors.very_soft_yellow })
hl('SpellRare', { fg = colors.very_soft_yellow })
hl('StatusLine', { fg = colors.white, bg = colors.darkgrey, bold = true })
hl('StatusLineNC', { fg = colors.warmgrey })
hl('StatusLineTerm', { fg = colors.white, bg = colors.darkgrey })
hl('StatusLineTermNC', { fg = colors.warmgrey, bg = colors.lightblack })
hl('TabLine', { fg = colors.grey, bg = colors.darkgrey })
hl('TabLineFill', { bg = colors.lightblack })
hl('TabLineSel', { fg = colors.white })
hl('Terminal', { fg = colors.white, bg = colors.black })
hl('Title', { fg = colors.yellow })
hl('VisualNOS', { bg = colors.darkgrey })
hl('Visual', { bg = colors.lightgrey })
hl('WarningMsg', { fg = colors.red })
hl('WildMenu', { fg = colors.black, bg = colors.yellow, bold = true })

-- Syntax Highlighting
hl('Comment', { fg = colors.grey, italic = true })
hl('Constant', { fg = colors.purple })
hl('String', { fg = colors.chartreuse })
hl('Character', { fg = colors.yellow })
hl('Number', { fg = colors.tomato })
hl('Boolean', { fg = colors.purple })
hl('Float', { fg = colors.tomato })
hl('Identifier', { fg = colors.orange })
hl('Function', { fg = colors.blue })
hl('Statement', { fg = colors.pink })
hl('Conditional', { fg = colors.lightorange })
hl('Repeat', { fg = colors.lightorange })
hl('Label', { fg = colors.very_soft_orange })
hl('Operator', { fg = colors.aqua })
hl('Keyword', { fg = colors.aqua })
hl('Exception', { fg = colors.red, bold = true })
hl('PreProc', { fg = colors.coral })
hl('Include', { fg = colors.pink })
hl('Define', { fg = colors.pink })
hl('Macro', { fg = colors.green })
hl('PreCondit', { fg = colors.green })
hl('Type', { fg = colors.lime_green, italic = true })
hl('StorageClass', { fg = colors.darkturquoise })
hl('Structure', { fg = colors.aqua })
hl('Typedef', { fg = colors.aqua })
hl('Special', { fg = colors.purple })
hl('SpecialChar', { fg = colors.pink })
hl('Tag', { fg = colors.pink })
hl('Delimiter', { fg = colors.pink })
hl('SpecialComment', { fg = colors.aqua })
hl('Debug', { fg = colors.crimson, bold = true })
hl('Underlined', { fg = colors.aqua, underline = true })
hl('Ignore', { fg = colors.darkgrey })
hl('Error', { fg = colors.pink, bg = colors.darkred })
hl('Todo', { fg = colors.orange, bold = true, italic = true })

-- Plugin: dashboard-nvim
hl('DashboardHeader', { fg = colors.orange })
hl('DashboardCenter', { fg = colors.light_yellow })
hl('DashboardCenterIcon', { fg = colors.aqua })
hl('DashboardShortCut', { fg = colors.pink })
hl('DashboardFooter', { fg = colors.vivid_orange })

-- JSON
hl('jsonKeyword', { fg = colors.orange })

-- HTML
hl('htmlTag', { fg = colors.white })
hl('htmlEndTag', { fg = colors.white })
hl('htmlTagName', { link = 'Tag' })
hl('htmlArg', { fg = colors.orange })
hl('htmlSpecialChar', { fg = colors.purple })

-- Treesitter Highlights
hl('@annotation', { fg = colors.coral, italic = true })
hl('@attribute', { fg = colors.aqua })
hl('@boolean', { link = 'Boolean' })
hl('@character', { link = 'Character' })
hl('@character.special', { link = 'SpecialChar' })
hl('@comment', { link = 'Comment' })
hl('@conditional', { link = 'Conditional' })
hl('@constant', { link = 'Constant' })
hl('@constant.builtin', { fg = colors.purple, bold = true, italic = true })
hl('@constant.macro', { fg = colors.green, bold = true })
hl('@constructor', { fg = colors.yellow })
hl('@debug', { link = 'Debug' })
hl('@define', { link = 'Define' })
hl('@error', { link = 'Error' })
hl('@exception', { link = 'Exception' })
hl('@field', { fg = colors.orange })
hl('@float', { link = 'Float' })
hl('@function', { link = 'Function' })
hl('@lsp.type.function', { link = 'Function' })
hl('@function.call', { link = 'Function' })
hl('@function.builtin', { fg = colors.camel, bold = true })
hl('@function.macro', { fg = colors.green, italic = true })
hl('@include', { link = 'Include' })
hl('@keyword', { link = 'Keyword' })
hl('@keyword.function', { fg = colors.light_blue, italic = true })
hl('@keyword.operator', { fg = colors.coral })
hl('@keyword.return', { fg = colors.pale_orange })
hl('@label', { link = 'Label' })
hl('@method', { fg = colors.blue, italic = true })
hl('@method.call', { fg = colors.blue, italic = true })
hl('@namespace', { fg = colors.light_yellow })
hl('@lsp.type.namespace', { link = '@namespace' })
hl('@none', {})
hl('@number', { link = 'Number' })
hl('@operator', { link = 'Operator' })
hl('@parameter', { fg = colors.pure_pink })
hl('@parameter.reference', { fg = colors.pure_pink })
hl('@preproc', { link = 'PreProc' })
hl('@property', { fg = colors.orange })
hl('@lsp.type.property', { link = '@property' })
hl('@punctuation.delimiter', { fg = colors.white })
hl('@punctuation.bracket', { fg = colors.white })
hl('@punctuation.special', { fg = colors.white })
hl('@repeat', { link = 'Repeat' })
hl('@storageclass', { link = 'StorageClass' })
hl('@string', { link = 'String' })
hl('@string.regex', { fg = colors.very_light_orange })
hl('@string.escape', { fg = colors.orange })
hl('@string.special', { fg = colors.orange })
hl('@symbol', { fg = colors.purple })
hl('@tag', { link = 'Tag' })
hl('@tag.attribute', { fg = colors.softred })
hl('@tag.delimiter', { link = 'Delimiter' })
hl('@text', { fg = colors.white })
hl('@markup.strong', { fg = colors.lightorange, bold = true })
hl('@markup.italic', { fg = colors.lime_green, italic = true })
hl('@markup.underline', { fg = colors.white, underline = true })
hl('@markup.strike', { fg = colors.white, strikethrough = true })
hl('@markup.heading', { fg = colors.very_light_orange, bold = true })
hl('@markup.heading.1', { fg = colors.very_light_orange, bold = true })
hl('@markup.heading.2', { fg = colors.light_yellow, bold = true })
hl('@markup.heading.3', { fg = colors.light_blue, bold = true })
hl('@markup.heading.4', { fg = colors.tea_green, bold = true })
hl('@markup.raw', { fg = colors.vivid_orange, italic = true })
hl('@markup.link', { fg = colors.aqua, undercurl = true })
hl('@markup.link.label', { fg = colors.aqua })
hl('@markup.link.url', { fg = colors.aqua, undercurl = true })
hl('@markup.math', { fg = colors.white, italic = true })
hl('@markup.quote', { fg = colors.orange, italic = true })
hl('@markup.enviroment', { fg = colors.white })
hl('@comment.note', { fg = colors.white })
hl('@comment.warning', { link = 'WarningMsg' })
hl('@comment.danger', { fg = colors.pink, bg = colors.darkred, bold = true })
hl('@type', { fg = colors.lime_green, italic = true })
hl('@lsp.type.type', { link = '@type' })
hl('@lsp.type.class', { fg = colors.lightorange })
hl('@type.builtin', { link = 'Type' })
hl('@type.qualifier', { link = 'Type' })
hl('@type.definition', { link = 'Type' })
hl('@variable', { fg = colors.vivid_orange })
hl('@variable.builtin', { fg = colors.camel, bold = true })

-- LSP Semantic Token Support
hl('@lsp.type.interface', { link = '@lsp.type.class' })
hl('@lsp.type.enum', { fg = colors.lime_green, italic = true })
hl('@lsp.type.struct', { fg = colors.aqua })
hl('@lsp.type.typeParameter', { fg = colors.coral, italic = true })
hl('@lsp.type.enumMember', { fg = colors.purple })
hl('@lsp.type.variable', { link = '@variable' })
hl('@lsp.type.parameter', { link = '@parameter' })
hl('@lsp.type.method', { link = 'Function' })
hl('@lsp.type.decorator', { fg = colors.pink })
hl('@lsp.mod.readonly', { italic = true })
hl('@lsp.mod.deprecated', { fg = colors.grey, strikethrough = true })
hl('@lsp.mod.static', { bold = true })
hl('@lsp.mod.abstract', { italic = true })
hl('@lsp.mod.defaultLibrary', { fg = colors.camel, bold = true })
hl('@lsp.typemod.function.defaultLibrary', { fg = colors.camel, bold = true })
hl('@lsp.typemod.method.defaultLibrary', { fg = colors.camel, bold = true })
hl('@lsp.typemod.variable.readonly', { fg = colors.purple })
hl('@lsp.typemod.variable.defaultLibrary', { fg = colors.camel, bold = true })
hl('@lsp.typemod.parameter.readonly', { fg = colors.purple })

-- Plugin: nvim-cmp
hl('CmpItemAbbrDeprecated', { fg = colors.grey, strikethrough = true })
hl('CmpItemAbbrMatch', { fg = colors.lime_green })
hl('CmpItemAbbrMatchFuzzy', { fg = colors.lime_green })
hl('CmpItemKindVariable', { fg = colors.light_blue })
hl('CmpItemKindInterface', { fg = colors.light_blue })
hl('CmpItemKindText', { fg = colors.softred })
hl('CmpItemKindFunction', { fg = colors.pink })
hl('CmpItemKindMethod', { fg = colors.pink })
hl('CmpItemKindKeyword', { fg = colors.vivid_orange })
hl('CmpItemKindProperty', { fg = colors.vivid_orange })
hl('CmpItemKindUnit', { fg = colors.vivid_orange })

-- Plugin: telescope.nvim
hl('TelescopeSelection', { link = 'Visual' })
hl('TelescopeSelectionCaret', { link = 'Visual' })
hl('TelescopeMultiSelection', { fg = colors.pink, bold = true })
hl('TelescopeMultiIcon', { fg = colors.vivid_orange })
hl('TelescopeNormal', { link = 'Normal' })
hl('TelescopePreviewNormal', { link = 'Normal' })
hl('TelescopePromptNormal', { link = 'Normal' })
hl('TelescopeResultsNormal', { link = 'Normal' })
hl('TelescopeBorder', { fg = colors.grey })
hl('TelescopePromptBorder', { fg = colors.aqua })
hl('TelescopeResultsBorder', { fg = colors.grey })
hl('TelescopePreviewBorder', { fg = colors.grey })
hl('TelescopeTitle', { fg = colors.yellow, bold = true })
hl('TelescopePromptTitle', { fg = colors.aqua, bold = true })
hl('TelescopeResultsTitle', { fg = colors.orange, bold = true })
hl('TelescopePreviewTitle', { fg = colors.light_blue, bold = true })
hl('TelescopePromptCounter', { fg = colors.grey })
hl('TelescopeMatching', { fg = colors.lime_green, bold = true })
hl('TelescopePromptPrefix', { fg = colors.pink, bold = true })
hl('TelescopePreviewLine', { bg = colors.lightblack })
hl('TelescopePreviewMatch', { fg = colors.lime_green, bold = true })
hl('TelescopePreviewPipe', { fg = colors.yellow })
hl('TelescopePreviewCharDev', { fg = colors.yellow })
hl('TelescopePreviewDirectory', { fg = colors.light_blue })
hl('TelescopePreviewBlock', { fg = colors.aqua })
hl('TelescopePreviewLink', { fg = colors.aqua, underline = true })
hl('TelescopePreviewSocket', { fg = colors.pink })
hl('TelescopePreviewRead', { fg = colors.light_green })
hl('TelescopePreviewWrite', { fg = colors.vivid_orange })
hl('TelescopePreviewExecute', { fg = colors.red })
hl('TelescopePreviewHyphen', { fg = colors.grey })
hl('TelescopePreviewSticky', { fg = colors.purple })
hl('TelescopePreviewSize', { fg = colors.aqua })
hl('TelescopePreviewUser', { fg = colors.light_green, italic = true })
hl('TelescopePreviewGroup', { fg = colors.light_green, italic = true })
hl('TelescopePreviewDate', { fg = colors.light_yellow })
hl('TelescopePreviewMessage', { fg = colors.white })
hl('TelescopePreviewMessageFillchar', { fg = colors.grey })
hl('TelescopeResultsClass', { fg = colors.lightorange })
hl('TelescopeResultsConstant', { fg = colors.purple })
hl('TelescopeResultsField', { fg = colors.orange })
hl('TelescopeResultsFunction', { fg = colors.blue })
hl('TelescopeResultsMethod', { fg = colors.blue })
hl('TelescopeResultsOperator', { fg = colors.aqua })
hl('TelescopeResultsStruct', { fg = colors.aqua })
hl('TelescopeResultsVariable', { fg = colors.vivid_orange })
hl('TelescopeResultsLineNr', { fg = colors.springgreen })
hl('TelescopeResultsIdentifier', { fg = colors.orange })
hl('TelescopeResultsNumber', { fg = colors.tomato })
hl('TelescopeResultsComment', { fg = colors.grey })
hl('TelescopeResultsSpecialComment', { fg = colors.aqua })
hl('TelescopeResultsDiffChange', { fg = colors.changefg })
hl('TelescopeResultsDiffAdd', { fg = colors.addfg })
hl('TelescopeResultsDiffDelete', { fg = colors.red })
hl('TelescopeResultsDiffUntracked', { fg = colors.grey })
