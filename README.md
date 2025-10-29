<h1 align="center"> Naz Neovim Theme </h1>

<p align="center">
  <img alt="GitHub Workflow Status" src="https://img.shields.io/github/actions/workflow/status/1995parham/naz.vim/lint.yaml?logo=github&style=for-the-badge">
</p>

## Nomenclature

This theme is named after Naz Township.
Naz township is located in Alborz province and in the western area of Fardis city.
This neighborhood is bounded by Hashemi Rafsanjani Street from the north and is adjacent to Mashkin Dasht,
Shahrak Dehkedeh, Farmarzieh, and Najaf Abad neighborhoods.

## Introduction

Naz theme is based on the tomorrow night theme but more cute.
It uses lua and [colorbuddy](https://github.com/tjdevries/colorbuddy.nvim) so it works with noevim 0.7.0+.
Naz theme has binding for following plugins:

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
- [nvim-telescope](https://github.com/nvim-telescope/telescope.nvim)

## Install

```lua
plugin({
  '1995parham/naz.vim',
  branch = 'main',
  config = function()
    require('naz')
  end,
})
```

## Where we can find colors?

You can use [`pastel`](https://github.com/sharkdp/pastel) to find out about colors
and their presentation on your terminal.

## Treesitter is awesome

After neovim start supporting [treesitter](https://github.com/tree-sitter/) a new era is begun.
In neovim 0.9 treesitter supports semantic highlight
which is described [here](https://gist.github.com/swarn/fb37d9eefe1bc616c2a7e476c0bc0316)

In a nutshell with `:Inspect` command you can see what semantic highlights are being applied to your code.
In general:

- `@lsp.type.<type>.<ft>` highlight for each token
- `@lsp.mod.<mod>.<ft>` highlight for each modifier of each token
- `@lsp.typemod.<type>.<mod>.<ft>` highlights for each modifier of each token

Also, you can read more about it on `:h treesitter-highlight-groups`.

### LSP Semantic Highlighting Support

Naz theme includes comprehensive LSP semantic token support for enhanced syntax highlighting:

**Type-related semantic tokens:**
- `@lsp.type.class` - Classes (light orange)
- `@lsp.type.interface` - Interfaces (linked to class)
- `@lsp.type.enum` - Enumerations (lime green, italic)
- `@lsp.type.struct` - Structs (aqua)
- `@lsp.type.type` - Type aliases
- `@lsp.type.typeParameter` - Generic type parameters (coral, italic)
- `@lsp.type.enumMember` - Enum members (purple)

**Function and method tokens:**
- `@lsp.type.function` - Functions (blue)
- `@lsp.type.method` - Methods (blue)

**Variable tokens:**
- `@lsp.type.variable` - Variables (vivid orange)
- `@lsp.type.parameter` - Function parameters (pure pink)
- `@lsp.type.property` - Object properties (orange)
- `@lsp.type.namespace` - Namespaces (light yellow)

**Modifier tokens:**
- `@lsp.mod.readonly` - Readonly/const modifier (italic)
- `@lsp.mod.deprecated` - Deprecated items (grey, strikethrough)
- `@lsp.mod.static` - Static members (bold)
- `@lsp.mod.abstract` - Abstract declarations (italic)
- `@lsp.mod.defaultLibrary` - Standard library items (camel, bold)

**Combined type+modifier tokens:**
- `@lsp.typemod.function.defaultLibrary` - Standard library functions
- `@lsp.typemod.method.defaultLibrary` - Standard library methods
- `@lsp.typemod.variable.readonly` - Readonly/const variables (purple)
- `@lsp.typemod.variable.defaultLibrary` - Standard library variables
- `@lsp.typemod.parameter.readonly` - Const parameters (purple)

To see semantic highlights in action, use `:Inspect` command while your cursor is on any token.

## Screenshots

### Go

![python sample](screenshots/go.png)

### NodeJS

![nodejs sample](screenshots/nodejs.png)

### Python

![python sample](screenshots/python.png)
