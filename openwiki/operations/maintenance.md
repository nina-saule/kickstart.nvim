---
type: operations
title: Maintenance and Repository Operations
description: Repository maintenance is split between local Neovim commands, Lua formatting checks, a tracked lazy.nvim lockfile, and scheduled OpenWiki pull requests. AGENTS.md and CLAUDE.md guide agents but do not affect Neovim runtime behavior.
tags: [maintenance, ci, formatting, openwiki, dependencies]
verified:
  - by: openwiki/0.6.1
    at: 2026-10-02T19:21:58.828Z
sources:
  - id: openwiki-source-6d4b4e707b8d60b6ccfa3425
    resource: repo://.github/workflows/openwiki-update.yml
  - id: openwiki-source-9143d8bbe559525ddec61cb0
    resource: repo://.github/workflows/stylua.yml
  - id: openwiki-source-ea70eb6c045047448e446296
    resource: repo://.gitignore
  - id: openwiki-source-07fd8d305303a725d0f4933f
    resource: repo://.stylua.toml
  - id: openwiki-source-8037e2358a2c4f9b2c722a11
    resource: repo://AGENTS.md
  - id: openwiki-source-a2371d6362e5db4bc834ad03
    resource: repo://CLAUDE.md
  - id: openwiki-source-76ff983893e83b435d4359bd
    resource: repo://init.lua
  - id: openwiki-source-15b968556da7e7fd1d48613d
    resource: repo://lazy-lock.json
generated: { by: "pi", at: "2026-10-02T19:21:58.828Z" }
---

# Maintenance and Repository Operations

## Plugin and tool maintenance

Use `:Lazy` to inspect plugin state and `:Lazy update` to update plugins. `lazy-lock.json` records resolved plugin branches and commits. The lockfile is ignored by `.gitignore`, so plugin resolution is not treated as a required working-tree artifact for new changes.

Mason manages configured language servers and tools from the `servers` table in `init.lua`. `:Mason` is the inspection and manual-install entrypoint. Tree-sitter parser updates run through its `:TSUpdate` build step.

## Formatting checks

`.stylua.toml` defines the Lua formatter: 160-column width, Unix line endings, two-space indentation, and single-quote preference where possible. The GitHub Actions Stylua workflow runs on `pull_request_target`, checks out the pull request head commit, and runs `stylua --check .` through the pinned Stylua action.

Run the equivalent local check with:

```sh
stylua --check .
```

The repository does not define a separate application build or test command. Feature-specific validation is provided by Neovim health checks, LSP diagnostics, configured linters, and `vim-test` commands.

## OpenWiki automation

The OpenWiki workflow runs on demand or daily at 08:00 UTC. It checks out full Git history so OpenWiki can compare against its previous documented commit, installs OpenWiki and optional Mermaid validation packages, and runs `openwiki code --update --print` with repository secrets supplied as environment variables.

The workflow removes transient `openwiki/.run.json`, stages `openwiki`, the workflow, `AGENTS.md`, and `CLAUDE.md` when present, and opens or updates the `openwiki/update` pull request. A failed OpenWiki run still creates a pull request containing pages completed before failure, then fails the workflow job.

## Agent guidance boundary

`AGENTS.md` contains the generated OpenWiki retrieval block and repository-wide agent instructions. `CLAUDE.md` contains the compact Neovim architecture and extension guide. These files document how to work on the repository; they are not sourced by `init.lua` and do not configure Neovim.
