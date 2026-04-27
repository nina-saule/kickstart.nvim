# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a Neovim configuration based on the Kickstart.nvim template with extensive customizations. The configuration uses lazy.nvim as the plugin manager and follows a modular architecture:

- **Core Configuration**: `init.lua` contains the main setup with global settings, options, basic keymaps, and plugin loading
- **Kickstart Plugins**: `lua/kickstart/plugins/` - Standard kickstart plugins (autopairs, debug, gitsigns, lint, neo-tree)
- **Custom Extensions**: `lua/custom/` - User-specific customizations
  - `lua/custom/keymaps.lua` - Custom keybindings and shortcuts
  - `lua/custom/plugins/` - Extended plugin configurations

## Key Components

### LSP and Language Support
- **LSP**: nvim-lspconfig with Mason for automatic LSP installation
- **Completion**: blink.cmp with LSP, buffer, and snippet sources
- **Formatters**: conform.nvim for code formatting
- **Languages**: Supports Go, Rust, Lua, JavaScript/TypeScript, JSON, and Zig
- **Treesitter**: Full syntax highlighting and text objects

### Navigation and File Management
- **Telescope**: Primary fuzzy finder with fd and ripgrep integration (uses telescope-zf-native for fuzzy matching)
- **Neo-tree**: File tree (`<C-n>` to toggle)
- **Yazi**: Advanced file manager integration (`<leader>zz`/`<leader>zd`/`<leader>zr`)
- **Grapple**: Project file bookmarking
- **Hop**: Enhanced motion plugin for quick character-based jumping (overrides f/F/t/T)
- **Session Manager**: Automatic session management with manual save/load capability

### Development Tools
- **Testing**: vim-test with toggleterm integration
- **Git**: Gitsigns, Neogit for Git operations
- **Terminal**: Toggleterm for integrated terminal management

### UI Enhancements
- **Theme**: Tokyo Night colorscheme
- **Statusline**: Custom lualine configuration
- **Buffer Management**: Bufferline with numbered tabs, mouse support, and LSP diagnostics
- **Start Screen**: Alpha dashboard
- **Notifications & Utilities**: Snacks.nvim (bigfile handling, quickfile, statuscolumn, input, picker, word highlighting, indent guides, image preview)

## File Structure Conventions

- **2-space indentation** for Lua, JSON, JavaScript/TypeScript
- **4-space indentation** for Go (with tabs)
- **Tab characters** preserved for Go files
- **Global settings** applied in `init.lua` with filetype-specific overrides

## Essential Commands

### Plugin Management
```bash
# Install/update plugins
:Lazy

# Update all plugins
:Lazy update

# Check plugin health
:checkhealth
```

### LSP Operations
```bash
# Install language servers
:Mason

# Format current buffer
<leader>fb

# LSP actions (when cursor on symbol)
grn - Rename symbol
gra - Code actions
grr - Find references
grd - Go to definition
gri - Go to implementation
```

### Testing
```bash
# Run nearest test
<leader>uu

# Run current file tests
<leader>uf

# Run last test
<leader>ul
```

### File Navigation
```bash
# Find files
<leader>sf

# Live grep
<leader>sg

# Recent files
<leader>s.

# File tree
<C-n>

# Yazi file manager
<leader>zz
```

## Custom Keybindings

### Core Navigation
- `<C-h/j/k/l>` - Window navigation
- `,,` - Toggle between last two buffers
- `<leader>x` - Close current buffer (using Bdelete)
- `<C-s>` - Save file (works in normal, insert, visual modes)
- `<C-x>` - Save all buffers and quit
- `<Tab>/<S-Tab>` - Cycle through buffers (next/previous)
- `<leader>1-7` - Jump to buffer by position
- `go` - Pick buffer to jump to
- `gC` - Pick buffer to close

### Visual Mode Enhancements
- `<A-j>/<A-k>` - Move selected lines down/up
- `</>`  - Indent left/right (maintains selection)

### Copy Operations
- `<leader>y` - Copy line (normal) or selection (visual) to system clipboard
- `<leader>cp` - Copy relative file path to clipboard
- `<leader>cP` - Copy absolute file path to clipboard

### Motion Enhancements (Hop)
- `f` - Hop to character forward (enhanced f motion)
- `F` - Hop to character backward (enhanced F motion)
- `t` - Hop till character forward (enhanced t motion)
- `T` - Hop till character backward (enhanced T motion)

## Configuration Patterns

### Adding New Plugins
1. Create new file in `lua/custom/plugins/`
2. Return plugin specification table
3. Use lazy loading when appropriate
4. Follow existing keymap patterns with descriptive names

### Extending LSP Support
1. Add server to `servers` table in `init.lua`
2. Install via Mason (`:Mason`)
3. Configure any server-specific settings in the servers table
   - Each entry is registered via `vim.lsp.config(name, cfg)`; `automatic_enable` from
     mason-lspconfig 2.x calls `vim.lsp.enable()` for installed servers.
   - Common capabilities (blink.cmp) are applied via `vim.lsp.config('*', ...)`.

### Customizing Keymaps
1. Add to `lua/custom/keymaps.lua`
2. Use descriptive `desc` fields for which-key integration
3. Follow leader key grouping conventions:
   - `<leader>s` - Search operations
   - `<leader>t` - Toggle operations
   - `<leader>u` - Unit testing
   - `<leader>c` - Copy operations
   - `<leader>g` - GitHub (snacks picker)
   - `<leader>h` - Git hunks (gitsigns)
   - `<leader>z` - Yazi

## Development Environment

- **Neovim Version**: 0.11.4+ required
- **Package Manager**: lazy.nvim
- **File Search**: Uses `fd` with .fdignore support
- **Text Search**: Uses `ripgrep` (rg)
- **Terminal**: Integrated via toggleterm
- **Platform**: Optimized for macOS (Darwin)
- **Session Management**: Automatic session save/restore (disabled autoload, autosaves on exit)

## Additional Notes

### Bufferline Features
- Numbered buffers for quick jumping (`<leader>1-7`)
- Mouse support for buffer selection and closing
- LSP diagnostics displayed in buffer tabs
- Uses `Bdelete` for safe buffer closing (preserves window layout)

### Telescope Configuration
- Vertical layout (90% width, 95% height)
- Uses `fd` for file finding (respects .fdignore)
- Uses `ripgrep` for live grep
- GitHub integration via telescope-gh extension