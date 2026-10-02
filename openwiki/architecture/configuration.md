---
type: architecture
title: Configuration Architecture
description: Neovim starts from init.lua, establishes global editor behavior, bootstraps lazy.nvim, and then loads bundled and custom plugin specifications. User keymaps live in a separately loaded module, while plugin-local keymaps and options stay with their plugin specs.
tags: [architecture, configuration, lazy.nvim, lua]
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
  - id: openwiki-source-299edbbbdf9c4e54dbe51b5b
    resource: repo://lua/custom/plugins/init.lua
generated: { by: "pi", at: "2026-10-02T19:21:58.828Z" }
---

# Configuration Architecture

## Runtime entrypoint

Neovim evaluates `init.lua` first. It enables Lua module caching, sets the leader keys before plugin loading, applies global options, and registers filetype-specific autocmds. The default indentation is two spaces; Go, JSON, JavaScript, TypeScript, and Ruby receive targeted overrides.

The file then defines basic keymaps and yank highlighting, bootstraps `lazy.nvim` under Neovim's data directory when it is missing, and prepends that path to the runtime path. A failed clone raises an error during startup rather than silently continuing.

## Plugin load boundary

`require('lazy').setup` owns plugin installation, loading, and update behavior. Its main specification includes a small set of direct plugin entries and imports `kickstart.plugins` modules explicitly. The `{ import = 'custom.plugins' }` entry loads every plugin specification in `lua/custom/plugins/`.

This creates two extension seams:

- Put Kickstart-derived or shared baseline modules in `lua/kickstart/plugins/` and require them from `init.lua`.
- Put user-owned plugin specs in `lua/custom/plugins/`; each file returns a lazy.nvim spec table. `lua/custom/plugins/init.lua` is only a placeholder and does not register plugins itself.

Plugin-local `keys`, `event`, `cmd`, `ft`, `opts`, and `config` fields determine when a plugin loads and how it is configured. Keep keymaps beside the plugin when their command depends on that plugin.

## Keymap ownership

`init.lua` owns global and LSP attachment keymaps. `lua/custom/keymaps.lua` is loaded after lazy.nvim setup and owns user-wide editing, window, clipboard, buffer, and save/quit mappings. Individual plugin files own feature-specific mappings through lazy.nvim's `keys` field.

`which-key.nvim` documents the main leader groups and exposes the configured mappings. The exact current mapping set should be discovered at runtime rather than copied into architecture documentation.

## Configuration changes

For a new plugin, add one spec file under `lua/custom/plugins/` unless it is part of the Kickstart baseline. For a global mapping, edit `lua/custom/keymaps.lua`; for a plugin mapping, edit that plugin's `keys` table. For a language server, edit the `servers` table in `init.lua`, where Mason's tool installer derives the install list.

After changing plugin specs, inspect `:Lazy` and use `:Lazy update` only when an update is intended. The lockfile records resolved plugin revisions; do not hand-edit it as a configuration mechanism.
