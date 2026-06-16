# honyx.nvim

A minimal Neovim colorscheme. Cool onyx darks, with warm honey-gold accents.
For diagnostics and general UI, a simple selection of soft red, blue and green
are used.

## Installation

**lazy.nvim**
```lua
{
  "germansc/honyx.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}
```

Adapt to your package manager of choice.

## Usage

```lua
require("honyx").setup()
vim.cmd.colorscheme("honyx")
```

Or set the colorscheme directly after ensuring the plugin is loaded:

```lua
vim.cmd.colorscheme("honyx")
```

## Options

```lua
require("honyx").setup({
  transparent = false, -- enable to remove all backgrounds
})
```

| Option        | Default | Description                          |
|---------------|---------|--------------------------------------|
| `transparent` | `false` | Remove all background highlights     |

## Palette

| Role         | Hex       |
|--------------|-----------|
| Background   | `#0f0f10` |
| Surface      | `#1a1a1c` |
| Highlight    | `#22262b` |
| Honey        | `#efc983` |
| Honey dim    | `#f3d8a5` |
| Honey dark   | `#d4aa6e` |
| Green        | `#78dbb8` |
| Blue         | `#9ab8d4` |
| Red          | `#FF7070` |
| Foreground   | `#F5F5FF` |
| Muted        | `#808590` |

## Integrations

Built-in support for:

- Tree-sitter
- LSP diagnostics
- Diff / git signs
- `nvim-tree.lua`
- Lualine
