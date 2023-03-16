# Naz Neovim Theme

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/1995parham/naz.vim/lint.yaml?label=ci&logo=github&style=flat-square&branch=main)

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

## Screenshots

### Go

![python sample](screenshots/go.png)

### NodeJS

![nodejs sample](screenshots/nodejs.png)

### Python

![python sample](screenshots/python.png)
