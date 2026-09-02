{ inputs, den, lib, config, ... }: {

#### VARIABLES ####
	# options.dataDirPath = lib.mkOption {
	# 	type = lib.types.path;
	# 	default = ./../data;
	# 	description = "Path of the data directory relative to den.nix";
	# };

	#### DEFAULTS ####
	den.default.nixos.system.stateVersion = "25.11";
	den.default.homeManager.home.stateVersion = "25.11";

	den.schema.host = host: {
		includes = [
			den.provides.hostname
		];

		nixos = { ... }: {
			den.nixpkgs = {
				source = inputs.nixpkgs;
				system = host.system; # Maps "x86_64-linux" directly
				config.allowUnfree = true;
			};
		 
			_module.args.inputs = inputs;
			
			nix.settings.experimental-features = [ "nix-command" "flakes" ];
			time.timeZone = lib.mkDefault "America/Los_Angeles";
		};
	};

	den.schema.user = user: {
		includes = [ den.provides.define-user ];
		classes = lib.mkDefault [ "homeManager" ];

		homeManager = { ... }: {
			home-manager.useGlobalPkgs = true;
			home-manager.useUserPackages = true;
		};
	};

	#### INITIAL DEFINITIONS ####
	den.hosts.x86_64-linux.tyche.users = {
		azutech = {};
	};
	den.hosts.x86_64-linux.fortuna.users = {
		azutech = {};
	};
	den.hosts.x86_64-linux.sanbar.users = {
		azutech = {};
	};
	den.hosts.x86_64-linux.atlas.users = {
		server-manager = {};
	};
	den.hosts.x86_64-linux.quake.users = {
		azutech = {};
	};
	den.hosts.x86_64-linux.spigot = {};
}
