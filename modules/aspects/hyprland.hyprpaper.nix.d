{ inputs, den, config, ... }: {

imports = [ inputs.den.flakeModule ];

	den.aspects.hyprland._.hyprpaper = {

		homeManager = { config, ... }: {
			services.hyprpaper = {
				enable = true;
				settings = {
				ipc = "on";
					splash = false;
					preload = [
						"${config.modules.theme.image.wallpaper}"
					];
					wallpaper = [
						{
							monitor = "";
							path = "${config.modules.theme.image.wallpaper}";
						}
					];
				};
			};
		};
		
	};
}
