-- `init.lua` is the entrypoint of configuring `nvim`. Often people load their user-defined modules in here and initialize them sequentially
-- editor resource configuration.
require("editor")
-- preffered keymap.
require("keymap")
-- third-party plugins.
require("third-party")
-- LSP setup
require("lsp")
