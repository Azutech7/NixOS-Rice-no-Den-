{ inputs, lib, ... }: {

	systems = [ "x86_64-linux" ];

	imports = [
		(inputs.flake-file.flakeModules.dendritic or { })
		(inputs.den.flakeModules.dendritic or { })
		(inputs.flake-parts.flakeModules.default or { })
	];
	
	flake-file.inputs = {
		den = {
			url = "github:denful/den";
			#inputs.nixpkgs.follows = "nixpkgs"; # <--- FORCES DEN TO USE YOUR 26.05
		};
		flake-file = {
			url = "github:denful/flake-file";
			#inputs.nixpkgs.follows = "nixpkgs"; # <--- FORCES FLAKE-FILE TO USE YOUR 26.05
		};
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		flake-parts = {
			url = "github:hercules-ci/flake-parts";
			inputs.nixpkgs-lib.follows = "nixpkgs";
		};
		import-tree.url = "github:vic/import-tree";
		nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
	};

}
