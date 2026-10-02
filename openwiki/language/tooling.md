---
type: tooling
title: Language and Development Tooling
description: The configuration combines Mason-managed language servers, blink.cmp completion, Conform formatting, nvim-lint diagnostics, Tree-sitter parsing, vim-test commands, and an available Go-focused DAP module. The active server and formatter lists are configured in init.lua.
tags: [lsp, completion, formatting, linting, testing, debugging]
verified:
  - by: openwiki/0.6.1
    at: 2026-10-02T19:21:58.828Z
sources:
  - id: openwiki-source-76ff983893e83b435d4359bd
    resource: repo://init.lua
  - id: openwiki-source-e843a3305034e56ce35de325
    resource: repo://lua/custom/plugins/vim-test.lua
  - id: openwiki-source-976eb583cb64a3eea8a95dfd
    resource: repo://lua/kickstart/plugins/debug.lua
  - id: openwiki-source-0b5da3d59f4c7ea845aff80a
    resource: repo://lua/kickstart/plugins/lint.lua
generated: { by: "pi", at: "2026-10-02T19:21:58.828Z" }
---

# Language and Development Tooling

## Language servers and completion

The active LSP stack is `nvim-lspconfig` with Mason, mason-lspconfig, and mason-tool-installer. The configured servers are `gopls`, `rust_analyzer`, `zls`, `jsonls`, and `lua_ls`. Mason derives its install list from the server table and adds `stylua`; mason-lspconfig enables installed servers automatically.

`blink.cmp` supplies completion and publishes its capabilities to every configured server. Completion uses LSP and buffer sources, with Lua also using lazydev integration. Ruby and ERB use buffer completion in the source selector. LSP attachment adds buffer-local rename, code action, reference, implementation, definition, declaration, symbol, and type-definition mappings. Inlay hints are available through `<leader>th` only when the attached server supports them.

Use `:Mason` to inspect or install tools. Add or remove language servers in the `servers` table in `init.lua`, not in generated Mason state.

## Formatting and linting

Conform loads before save and formats through LSP fallback. It runs `stylua` for Lua, formats on save with a 500 ms timeout, and exposes manual formatting through `<leader>fb`. C and C++ are excluded from automatic format-on-save.

`nvim-lint` currently configures `clippy` for Rust. It runs on buffer enter, after writes, and when leaving insert mode, but only for modifiable buffers. `<leader>l` triggers linting manually.

## Parsing and editing support

Tree-sitter installs a fixed parser set that includes Lua, Ruby, Rust, JavaScript, TypeScript, TSX, JSON, Markdown, YAML, SQL, and other configuration and web languages. A filetype autocmd attaches an installed parser immediately or installs an available parser before attaching it. Tree-sitter indentation is used when the language provides an indent query. The separate context plugin is disabled by default and can be toggled with `<leader>tc`.

## Tests and debugging

`vim-test` is command-lazy and runs tests in ToggleTerm. The active shortcuts are `<leader>uu` for the nearest test, `<leader>uf` for the current file, and `<leader>ul` for the last test.

The Go-focused DAP configuration is present in `lua/kickstart/plugins/debug.lua`, with `delve` managed through Mason and F5/F1/F2/F3 plus breakpoint mappings. Its `require` line is commented out in `init.lua`, so this debugger module is available as a template but is not active unless explicitly imported.

Ruby snippets are exposed through `snippets/package.json` and `snippets/ruby.json`; this is separate from LSP completion.
