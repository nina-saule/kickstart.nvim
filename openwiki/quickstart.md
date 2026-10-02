---
type: guide
title: Quickstart
description: Start at init.lua, use lazy.nvim and Mason for dependency state, and follow the linked workflow pages for editing or configuration changes. The shortest extension path is a custom plugin spec under lua/custom/plugins/ or a global mapping in lua/custom/keymaps.lua.
tags: [quickstart, guide, navigation]
verified:
  - by: openwiki/0.6.1
    at: 2026-10-02T19:21:58.828Z
sources:
  - id: openwiki-source-9143d8bbe559525ddec61cb0
    resource: repo://.github/workflows/stylua.yml
  - id: openwiki-source-a2371d6362e5db4bc834ad03
    resource: repo://CLAUDE.md
  - id: openwiki-source-76ff983893e83b435d4359bd
    resource: repo://init.lua
generated: { by: "pi", at: "2026-10-02T19:21:58.828Z" }
---

# Quickstart

## Start here

1. Open the repository at `/Users/ernest/.config/nvim`.
2. Read `init.lua` for startup order, editor options, LSP servers, completion, formatting, and the main plugin list.
3. Use `lua/custom/keymaps.lua` for user-wide mappings and `lua/custom/plugins/` for user-owned plugin specs.

The configuration uses Space as the leader key and targets Neovim 0.11+. Use which-key to discover current mappings instead of maintaining a hand-written list.

## Common commands

- `:Lazy` — inspect plugin state.
- `:Lazy update` — update plugins intentionally.
- `:Mason` — inspect or install language servers and tools.
- `:checkhealth` — inspect Neovim and plugin health.
- `stylua --check .` — run the repository's Lua formatting check locally.

## Find the right page

- Startup, load order, and extension seams: [Configuration Architecture](architecture/configuration.md)
- Buffers, files, terminal, Git, clipboard, and sessions: [Editing and Navigation Workflow](workflows/editing.md)
- LSP, completion, formatting, linting, tests, and debugging: [Language and Development Tooling](language/tooling.md)
- Formatting, lockfiles, CI, and OpenWiki updates: [Maintenance and Repository Operations](operations/maintenance.md)

## Add a change

- Add a plugin: create `lua/custom/plugins/<name>.lua` returning a lazy.nvim spec table.
- Add a global keymap: edit `lua/custom/keymaps.lua` and include a `desc`.
- Add a plugin keymap: put it in that plugin's `keys` table.
- Add an LSP: add it to the `servers` table in `init.lua`; Mason installs it through the configured installer.
