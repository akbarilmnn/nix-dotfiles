# structure 

this is how i structure my editor configuration.

```
# root dir.
.
├── init.lua # initializer.
├── lazy-lock.json # all the depedencies it needs.
├── lua/
└── README.md # manual (in case i forgot).

# inside lua folder.
└─┬ .
  ├─┬ lua
  │ ├─┬ plugins
  │ │ ├─┬ lsp
  │ │ │ ├── nvimdevel.lua (for neovim development lsp completions)
  │ │ │ ├── lspconfig.lua (lsp server configurations)
  │ │ │ ├── linters.lua (linters configurations)
  │ │ │ ├── fmt.lua (formatters configurations)
  │ │ │ ├── diagnostics.lua (pretty diagnostics viewers)
  │ │ │ └── completions.lua (completion engines)
  │ │ ├── statusline.lua (statusline)
  │ │ ├── tmux.lua (integration with tmux)
  │ │ ├── search.lua (pretty search bar)
  │ │ ├── niceui.lua (beautify UI for neovim)
  │ │ ├── indent.lua (coloring indentation lines)
  │ │ ├── highlights.lua (tree-sitter highlights)
  │ │ ├── fzf.lua (fuzzy-finding items)
  │ │ └── filemanager.lua (Oil.nvim file manager)
  │ ├── utils.lua (helper functions)
  │ └── usercmds.lua (custom user commands)
```
