# Configuring Neovim

## Overview
This is file is the documentation for my neovim configuration. Keep in mind that my configuration is always changing. 
Anyways, this the file structure for my neovim setup.

```sh
.
├── init.lua # sets up all components
├── lazy-lock.json # lockfile to lock plugin versions
├── lsp # directory to configure each language server installed
│   ├── lua_ls.lua
│   ├── cssls.lua
│   ├── emmet_language_server.lua
│   ├── gopls.lua
│   ├── zls.lua
│   ├── ruff.lua
│   ├── pyright.lua
│   ├── clangd.lua
│   └── denols.lua
└── lua # directory that contains components (keymappings, basic settings, auto-commands, plugins) for my config
    ├── autocmds.lua # functions that runs when an event happens 
    ├── colorschemes.lua # all availables colorscheme names installed
    ├── config.lua # basic settings for neovim
    ├── lsp.lua # configuratios to enable LSPs and modify their behaviour
    ├── maps.lua # general keymaps for all buffers
    ├── packages.lua # entrypoint for plugins (this file makes the `plugins/` directory useful)
    ├── plugins
    │   ├── autocomplete.lua # setup autocompletions
    │   ├── brackets.lua # setup for pairing brackets and quotes
    │   ├── explorer.lua # setup for file explorer
    │   ├── formatting.lua # setup for formatting texts based on its filetype
    │   ├── fzf.lua # fuzzy finder for files, buffers, text, and so much more in neovim
    │   ├── glamour.lua # setup for prettier TUI in `neovim`
    │   ├── indentation.lua # setup for adding colors to indentation
    │   ├── installer.lua # setup for installing LSP, formatters, linters and DAP.
    │   ├── linter.lua # setup for linting based on its filetype
    │   ├── markdown.lua # setup for rendering markdown files inside `neovim`
    │   ├── statusline.lua # setup for statusbar
    │   ├── syntax.lua # setup for syntax highlighting
    │   ├── tmuxnav.lua # setup for vim-like tmux window navigation
    │   ├── transparent.lua # setup for transparent UI completion in neovim
    │   └── theme.lua # setup for colorscheme picker that is defined in `colorschemes.lua`
```
