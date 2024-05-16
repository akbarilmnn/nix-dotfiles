# structure 

this is how i structure my editor configuration.

```
.
├── init.lua # initializer.
├── lazy-lock.json # all the depedencies it needs.
├── lua 
│  ├── config.lua # basic editor configuration.
│  ├── keymaps.lua # preffered keymaps.
│  ├── pacman.lua # package manager (Lazy.nvim) initializer
│  └── plugins # directory full of downloaded plugins using package manager.
└── README.md # manual (in case i forgot).
```
