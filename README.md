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

  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = { bold = false },
  },

  overrides = {
    NormalFloat = { bg = "#1f1f22" },
    Comment = { fg = "#70757f" },
  },
})
```

| Option         | Default                                              | Description                          |
|----------------|------------------------------------------------------|--------------------------------------|
| `transparent`  | `false`                                              | Remove all background highlights     |
| `styles`       | comment and keywords italics on; function styles off | Apply shared text styles by role     |
| `overrides`    | `{}`                                                 | Override individual highlight groups |

`styles.comments` applies to `Comment` and `SpecialComment`.

`styles.keywords` applies to `Statement`, `Conditional`, `Repeat`, `Label`, `Operator`, `Keyword`, `PreProc`, `Include`, `Define`, `Macro`, and `PreCondit`.

`styles.functions` applies to `Function`.

`overrides` is merged last, so it can replace any generated highlight field.

## Palette

| Role         | Hex       |
|--------------|-----------|
| Background   | `#0f0f10` ![#0f0f10](https://placehold.co/30x15/0f0f10/0f0f10.png)  |
| Surface      | `#1a1a1c` ![#1a1a1c](https://placehold.co/30x15/1a1a1c/1a1a1c.png)  |
| Highlight    | `#22262b` ![#22262b](https://placehold.co/30x15/22262b/22262b.png)  |
| Honey        | `#efc983` ![#efc983](https://placehold.co/30x15/efc983/efc983.png)  |
| Honey light  | `#f3d8a5` ![#f3d8a5](https://placehold.co/30x15/f3d8a5/f3d8a5.png)  |
| Honey dark   | `#d4aa6e` ![#d4aa6e](https://placehold.co/30x15/d4aa6e/d4aa6e.png)  |
| Green        | `#78dbb8` ![#78dbb8](https://placehold.co/30x15/78dbb8/78dbb8.png)  |
| Blue         | `#9ab8d4` ![#9ab8d4](https://placehold.co/30x15/9ab8d4/9ab8d4.png)  |
| Red          | `#FF7070` ![#FF7070](https://placehold.co/30x15/FF7070/FF7070.png)  |
| Foreground   | `#F5F5FF` ![#F5F5FF](https://placehold.co/30x15/F5F5FF/F5F5FF.png)  |
| Muted        | `#808590` ![#808590](https://placehold.co/30x15/808590/808590.png)  |

## Integrations

Built-in support for:

- Tree-sitter
- LSP diagnostics
- Diff / git signs
- `nvim-tree.lua`
- Lualine
