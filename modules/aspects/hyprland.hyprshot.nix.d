{ inputs, den, config, ... }: {

imports = [ inputs.den.flakeModule ];

	den.aspects.hyprland._.hyprshot = {

		homeManager = { config, ... }: {
			programs.hyprshot = {
				enable = true;

				saveLocation = "${config.home.homeDirectory}/Pictures/Screenshots";
			};
		};
		
	};
}
