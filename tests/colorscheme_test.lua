-- Test script for naz colorscheme
-- This script verifies that the colorscheme loads correctly and all essential highlight groups are defined

-- Load the colorscheme
vim.cmd('colorscheme naz')

-- Test 1: Verify colorscheme is loaded
assert(vim.g.colors_name == 'naz', 'Colorscheme name should be "naz"')
print('✓ Colorscheme name is set correctly')

-- Test 2: Verify termguicolors is enabled
assert(vim.o.termguicolors == true, 'termguicolors should be enabled')
print('✓ termguicolors is enabled')

-- Test 3: Verify background is set
assert(vim.o.background == 'dark', 'Background should be "dark"')
print('✓ Background is set to dark')

-- Test 4: Essential highlight groups should be defined
local essential_groups = {
  -- Editor UI
  'Normal',
  'Comment',
  'Visual',
  'Search',
  'LineNr',
  'CursorLine',
  'Pmenu',
  'FloatBorder',

  -- Syntax
  'Function',
  'String',
  'Keyword',
  'Constant',
  'Type',
  'Operator',

  -- Treesitter
  '@function',
  '@variable',
  '@keyword',
  '@string',
  '@comment',
  '@type',

  -- LSP Semantic tokens
  '@lsp.type.class',
  '@lsp.type.function',
  '@lsp.type.variable',
  '@lsp.type.parameter',
  '@lsp.mod.readonly',
  '@lsp.mod.deprecated',

  -- Plugins
  'TelescopeSelection',
  'CmpItemAbbrMatch',
  'DashboardHeader',
}

local missing_groups = {}
for _, group in ipairs(essential_groups) do
  local hl = vim.api.nvim_get_hl(0, { name = group })
  if not next(hl) then
    table.insert(missing_groups, group)
  end
end

if #missing_groups > 0 then
  error('Missing highlight groups: ' .. table.concat(missing_groups, ', '))
end
print('✓ All essential highlight groups are defined (' .. #essential_groups .. ' groups)')

-- Test 5: Verify specific color values for key groups
local function check_color(group, expected_fg, expected_bg)
  local hl = vim.api.nvim_get_hl(0, { name = group })

  if expected_fg and hl.fg then
    local fg = string.format('#%06x', hl.fg)
    assert(fg:lower() == expected_fg:lower(),
      string.format('%s foreground color mismatch: expected %s, got %s', group, expected_fg, fg))
  end

  if expected_bg and hl.bg then
    local bg = string.format('#%06x', hl.bg)
    assert(bg:lower() == expected_bg:lower(),
      string.format('%s background color mismatch: expected %s, got %s', group, expected_bg, bg))
  end
end

check_color('Normal', '#f5f5f0', '#323232')
check_color('Comment', '#a8a8a0', nil)
check_color('Function', '#40d0ff', nil)
print('✓ Key colors are set correctly')

-- Test 6: Verify text styles (bold, italic, etc.)
local function check_style(group, expected_styles)
  local hl = vim.api.nvim_get_hl(0, { name = group })

  for style, expected in pairs(expected_styles) do
    if expected then
      assert(hl[style], string.format('%s should have %s style', group, style))
    end
  end
end

check_style('Comment', { italic = true })
check_style('Todo', { bold = true, italic = true })
check_style('@markup.strong', { bold = true })
check_style('@lsp.mod.deprecated', { strikethrough = true })
print('✓ Text styles are applied correctly')

-- Test 7: Verify links work correctly
local function check_link(group, expected_link)
  local hl = vim.api.nvim_get_hl(0, { name = group })
  assert(hl.link == expected_link,
    string.format('%s should link to %s, got %s', group, expected_link, hl.link or 'none'))
end

check_link('@boolean', 'Boolean')
check_link('@lsp.type.interface', '@lsp.type.class')
check_link('TelescopeSelection', 'Visual')
print('✓ Highlight group links are set correctly')

print('\n=== All tests passed! ===')
print('Colorscheme is working correctly.')
