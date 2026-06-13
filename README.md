# Honyx

Honyx is a minimal Neovim colorscheme with a dark slate base and restrained
honey-toned accents.

## Install

With `lazy.nvim`:

```lua
{
  "germansc/honyx",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("honyx")
  end,
}
```

## Palette Direction

- low contrast and limited palette.
- cool dark slate shades for neutrals and UI
- cool white core foreground, and a dim alt.
- honey/gold shades as the primary accent
- soft green, blue and red for diagnostic and general UI highlighting..
