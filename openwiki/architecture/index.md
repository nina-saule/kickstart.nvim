# Files

- [Configuration Architecture](configuration.md) - Neovim starts from init.lua, establishes global editor behavior, bootstraps lazy.nvim, and then loads bundled and custom plugin specifications. User keymaps live in a separately loaded module, while plugin-local keymaps and options stay with their plugin specs.
