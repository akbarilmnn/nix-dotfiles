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
│   ├── bacon_ls.lua
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
    ├── usercmds.lua # user defined neovim commands 
    ├── colorschemes.lua # all availables colorscheme names installed
    ├── editor.lua # basic settings for neovim
    ├── lsp.lua # configuratios to enable LSPs and modify their behaviour
    ├── keymap.lua # general keymaps for all buffers
    ├── third-party.lua # entrypoint for plugins (this file makes the `plugins/` directory useful)
    ├── plugins
    │   ├── autocompletion.lua # setup autocompletions
    │   ├── brackets.lua # setup for pairing brackets and quotes
    │   ├── filemanager.lua # setup for file explorer
    │   ├── fmtter.lua # setup for formatting texts based on its filetype
    │   ├── finder.lua # fuzzy finder for files, buffers, text, and so much more in neovim
    │   ├── aesthetic.lua # setup for prettier TUI in `neovim`
    │   ├── indentation.lua # setup for adding colors to indentation
    │   ├── installer.lua # setup for installing LSP, formatters, linters and DAP.
    │   ├── linter.lua # setup for linting based on its filetype
    │   ├── jump.lua # code hopper 
    │   ├── markdown.lua # setup for rendering markdown files inside `neovim`
    │   ├── statusline.lua # setup for statusbar
    │   ├── highlight.lua # setup for syntax highlighting
    │   └── transparent.lua # setup for transparent UI completion in neovim
```
