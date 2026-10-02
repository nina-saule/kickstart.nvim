---
type: workflow
title: Editing and Navigation Workflow
description: The configuration organizes everyday editing around leader-key commands, bufferline navigation, Neo-tree and Yazi file browsing, ToggleTerm, Git tools, and Git-scoped bookmarks. Clipboard, save, window, and session behavior is split between global keymaps and plugin-local specs.
tags: [editing, navigation, buffers, terminal, git, sessions]
verified:
  - by: openwiki/0.6.1
    at: 2026-10-02T19:21:58.828Z
sources:
  - id: openwiki-source-76ff983893e83b435d4359bd
    resource: repo://init.lua
  - id: openwiki-source-c750a561181a65e7ce78f98b
    resource: repo://lua/custom/keymaps.lua
  - id: openwiki-source-83388bafede1969c7e8a0b8a
    resource: repo://lua/custom/plugins/bufferline.lua
  - id: openwiki-source-5f7c8fed2ccf841be964f73f
    resource: repo://lua/custom/plugins/grapple.lua
  - id: openwiki-source-1eb52138b7ea47a5e5f47ac2
    resource: repo://lua/custom/plugins/neogit.lua
  - id: openwiki-source-fe94497d5f654e6b147c65f5
    resource: repo://lua/custom/plugins/session-manager.lua
  - id: openwiki-source-7e314650ad67738c6c4c02ef
    resource: repo://lua/custom/plugins/snacks.lua
  - id: openwiki-source-c4e0b0c2dbdede2e7c4ad5cb
    resource: repo://lua/custom/plugins/toggleterm.lua
  - id: openwiki-source-19da9b1fa81c95fe51a95d09
    resource: repo://lua/custom/plugins/yazi.lua
  - id: openwiki-source-db21a5e56f75aa02cddc3561
    resource: repo://lua/kickstart/plugins/neo-tree.lua
generated: { by: "pi", at: "2026-10-02T19:21:58.828Z" }
---

# Editing and Navigation Workflow

## Windows, buffers, and files

The leader key is Space. Window focus moves with `<C-h>`, `<C-j>`, `<C-k>`, and `<C-l>` in normal and visual modes. `,,` toggles the previous buffer. `<leader>x` closes a buffer through bufdelete, while `<leader>X` uses the standard delete command. `<C-s>` saves in normal, insert, and visual modes; `<C-x>` saves writable named buffers and quits.

Bufferline supports `<Tab>` and `<S-Tab>` cycling, `go` to pick a buffer, `gC` to pick one to close, and `<leader>1` through `<leader>7` for numbered buffer jumps. Bufferline uses `Bdelete` for normal close actions, preserving the configured buffer layout.

Neo-tree opens or focuses from `<C-n>` and `<C-\>`. Yazi provides three entrypoints: `<leader>zz` opens at the current file, `<leader>zd` opens in the current working directory, and `<leader>zr` toggles the resumed file-manager session. Yazi is configured to open directories directly.

## Editing and clipboard

Visual selections can be moved with `<A-j>` and `<A-k>` and re-indented with `<` or `>` while keeping the selection active. `<leader>y` copies a line or selection to the system clipboard. `<leader>v` and `<leader>V` paste from the system clipboard after or before the cursor.

`<leader>cp` copies a Git-root-relative path when the current buffer belongs to a Git repository and falls back to the current path. `<leader>cP` copies the absolute path. `Q` and `q` are disabled to avoid accidental Ex-mode entry.

## Terminal and Git work

`<leader>tt` toggles ToggleTerm. The terminal plugin also defines command abbreviations for `tt` and visual-selection sending. `<Esc><Esc>` exits the built-in terminal's terminal mode; external terminal behavior is not changed.

Neogit opens with `<leader>n` and uses Diffview as an optional integration. Snacks provides GitHub issue and pull-request pickers under `<leader>gi`, `<leader>gI`, `<leader>gp`, and `<leader>gP`. Grapple tags are scoped to the Git repository: `<leader>M` toggles the current tag and `<leader>m` opens the tag window.

## Sessions and discovery

Session files are stored under Neovim's data directory. Automatic loading is disabled, but the session manager autosaves the last session on exit and session switches, ignoring non-normal buffers and `gitcommit` buffers.

Use which-key to discover current mappings. The stable documentation describes workflow entrypoints; plugin files remain the source of truth for exact commands and lazy-loading triggers.
