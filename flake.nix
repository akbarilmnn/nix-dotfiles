{
  description = "flake for dotfiles";

  inputs = {
    # using the currently up-to-date packages on `nixpkgs`
    nixpkgs.url = "github:nixos/nixpkgs/master";

    # home manager that follows nixpkgs version 
    home-manager.url = "github:nix-community/home-manager";
    # make sure to follow the version of nixpkgs 
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; 
     
  };

  outputs = { self, nixpkgs, home-manager, ... }:
	let 
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in
	 {
	# configurations for home-manager 
	homeConfigurations = {
		# user's home-manager configuration
		serein = home-manager.lib.homeManagerConfiguration {
			inherit pkgs;
			modules = [ 
				./home.nix
			 ];
		};
	};
  };
}
