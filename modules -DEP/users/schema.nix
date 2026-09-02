{ inputs, den, lib, config, ... }: {

	imports = [ inputs.den.flakeModule ];

	den.default.includes = [ { homeManager = { ... }: { home.stateVersion = "25.11"; }; } ];
	
    den.schema.user = user: {
		includes = [ den.provides.define-user ];

		classes = lib.mkDefault [ "homeManager" ];

		homeManager = { lib, ... }: {
			home-manager.useGlobalPkgs = true;
			home-manager.useUserPackages = true;
		};
	};
}