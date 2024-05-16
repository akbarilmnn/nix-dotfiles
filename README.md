# a more organized dotfiles

# Dependencies 
-   [nix](https://nixos.org/download)
-   [home-manager](https://nix-community.github.io/home-manager)

# Setup 

### Add the appropriate Home Manager channel 
for example this is the master or the unstable channel 

```
$ nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
$ nix-channel --update
```

### Install Home Manager

```
$ nix-shell '<home-manager>' -A install
```

close your shell and reopen a new one.

