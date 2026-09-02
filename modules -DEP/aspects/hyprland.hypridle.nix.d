{ inputs, den, ... }: {

imports = [ inputs.den.flakeModule ];

	den.aspects.hyprland._.hypridle = {

		homeManager = { ... }: {
			services.hypridle = {
				enable = true;

				settings = {

					general = {
						lock_cmd = "pidof hyprlock || hyprlock";
						before_sleep_cmd = "loginctl lock-session";
						after_sleep_cmd  = "hyprctl dispatch dpms on";	
					};

					listener = [
						{
							timeout = 1800;
							on-timeout = "brightnessctl -s set 10%; loginctl lock-session";
							on-resume = "brightnessctl -r";
						}
					];
						
				};	
				
			};
		};
		
	};
}
