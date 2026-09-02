{ inputs, den, pkgs, lib, host, config, ... }: {

	#imports = [ 
		#inputs.den.flakeModule
		#inputs.disko.flakeModules.default
	#];

	flake-file.inputs.disko = {
		url = "github:nix-community/disko";
		inputs.nixpkgs.follows = "nixpkgs";
	};

	#den.default.includes = [ { nixos = { ... }: { imports = [ inputs.disko.nixosModules.disko ]; }; } ];
}
