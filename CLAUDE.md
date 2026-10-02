# Neovim Config

Kickstart.nvim template, lazy.nvim plugin manager, Tokyo Night theme, Neovim 0.11+.

## File structure

- `init.lua` — options, global keymaps, and most plugin specs (LSP, blink.cmp, Telescope, Treesitter, conform.nvim)
- `lua/kickstart/plugins/` — stock kickstart plugins (autopairs, debug, gitsigns, lint, neo-tree)
- `lua/custom/keymaps.lua` — user keymaps
- `lua/custom/plugins/` — one file per user plugin

## Conventions

- New plugin: create a file in `lua/custom/plugins/` returning a spec table. Use `keys =` for lazy loading; keep keymaps inside the plugin spec so they stay near their config.
- New keymap: `lua/custom/keymaps.lua`, or `keys =` in the plugin spec. Always set `desc` (which-key).
- New LSP server: add to the `servers` table in `init.lua`; install via Mason.
- Indent: 2 spaces globally. FileType autocmds in `init.lua` override: Go = 4-space, no expandtab; JSON/JS/TS = 2-space; Ruby keeps tabstop 2 but strips indentkeys for dot/brace.

## Keymap groups (leader)

- `<leader>s` — Telescope search (`<leader>sk` lists all keymaps)
- `<leader>u` — tests (vim-test via toggleterm)
- `<leader>h` — git hunks (gitsigns)
- `<leader>g` — GitHub issues/PRs (snacks picker)
- `<leader>z` — Yazi file manager
- `<leader>x` — close buffer; `<leader>c` — copy paths/clipboard
- `<leader>f` — format buffer; `<leader>i` — diagnostic float

<!-- OPENWIKI:START -->

## OpenWiki

@AGENTS.md

<!-- OPENWIKI:END -->
