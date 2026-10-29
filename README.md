# honyx.nvim

A minimal dark-only Neovim colorscheme. Cool onyx darks, with warm honey-gold
accents. For diagnostics and general UI, a simple selection of soft red, blue
and green are used.

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
```

`setup(opts)` configures and applies the colorscheme. To reload it later, run
`:colorscheme honyx`; this reapplies the stored options (or the defaults if
`setup()` was never called).

## Options

```lua
require("honyx").setup({
  transparent = false, -- enable to remove the main window backgrounds
  terminal_colors = true, -- override terminal ANSI colors

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

| Option            | Default                                              | Description                          |
| ----------------- | ---------------------------------------------------- | ------------------------------------ |
| `transparent`     | `false`                                              | Remove the main window backgrounds   |
| `terminal_colors` | `true`                                               | Override terminal ANSI colors        |
| `styles`          | comment and keywords italics on; function styles off | Apply shared text styles by role     |
| `overrides`       | `{}`                                                 | Override individual highlight groups |

`styles.comments` applies to `Comment` and `SpecialComment`.

`styles.keywords` applies to `Statement`, `Conditional`, `Repeat`, `Label`, `Keyword`, `PreProc`, `Include`, `Define`, `Macro`, and `PreCondit`.

`styles.functions` applies to `Function`.

`overrides` is merged last, so it can replace any generated highlight field.

## Palette

| Role        | Hex                                                                |
| ----------- | ------------------------------------------------------------------ |
| Background  | `#0f0f10` ![#0f0f10](https://placehold.co/30x15/0f0f10/0f0f10.png) |
| Surface     | `#1a1a1c` ![#1a1a1c](https://placehold.co/30x15/1a1a1c/1a1a1c.png) |
| Highlight   | `#22262b` ![#22262b](https://placehold.co/30x15/22262b/22262b.png) |
| Honey       | `#efc983` ![#efc983](https://placehold.co/30x15/efc983/efc983.png) |
| Honey light | `#f3d8a5` ![#f3d8a5](https://placehold.co/30x15/f3d8a5/f3d8a5.png) |
| Honey dark  | `#d4aa6e` ![#d4aa6e](https://placehold.co/30x15/d4aa6e/d4aa6e.png) |
| Green       | `#78dbb8` ![#78dbb8](https://placehold.co/30x15/78dbb8/78dbb8.png) |
| Blue        | `#9ab8d4` ![#9ab8d4](https://placehold.co/30x15/9ab8d4/9ab8d4.png) |
| Red         | `#D96868` ![#D96868](https://placehold.co/30x15/D96868/D96868.png) |
| Foreground  | `#F5F5FF` ![#F5F5FF](https://placehold.co/30x15/F5F5FF/F5F5FF.png) |
| Muted       | `#808590` ![#808590](https://placehold.co/30x15/808590/808590.png) |

## Integrations

Built-in support for:

- Tree-sitter
- LSP diagnostics
- Diff / git signs
- `nvim-tree.lua`
- Lualine
