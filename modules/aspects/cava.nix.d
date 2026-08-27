{ inputs, den, config, ... }: {

imports = [ inputs.den.flakeModule ];

	den.aspects.cava = {

		homeManager = { config, ... }:
			let
				bg = config.modules.theme.color.background;
				fg = config.modules.theme.color.foreground;
			in
			{
				programs.cava = {
					enable = true;
			
					settings = {
						general.framerate = 60;
						input.method = "alsa";
						smoothing.noise_reduction = 88;
						color = {
							background = "'#${bg}’";
							foreground = "'#${fg}'";
						};
					};
				};
			};
		
	};
}
