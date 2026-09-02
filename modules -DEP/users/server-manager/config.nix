{ inputs, den, ... }: {

imports = [ inputs.den.flakeModule ];

	den.aspects.server-manager = {
		
		includes = [
			den.provides.define-user
			den.provides.primary-user
			(den.provides.user-shell "bash")
		];

		nixos = { pkgs, ... }: {
			virtualisation.docker.enable = true;
		
			environment.systemPackages = with pkgs; [
				micro
				unzip
				docker-compose
				lazydocker
				packwiz
			];

			users.users.server-manager.extraGroups = [ "docker" ];
		};

		homeManager = { pkgs, ... }: {
			home.packages = with pkgs; [
				
			];
		};
		
	};
}
