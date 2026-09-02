{ inputs, den, config, ... }: {

imports = [ inputs.den.flakeModule ];

	den.aspects.azutech = {
		
		includes = [
			den.provides.primary-user

			den.aspects.bash
			den.aspects.btop
			den.aspects.cava
			den.aspects.fastfetch
			den.aspects.firefox
			den.aspects.flatpak
			den.aspects.fuzzel
			den.aspects.hyprland._.hypridle
			den.aspects.hyprland._.hyprlock
			den.aspects.hyprland._.hyprpaper
			den.aspects.hyprland._.hyprshot
			den.aspects.hyprland
			den.aspects.kitty
			den.aspects.ly
			den.aspects.mako
			den.aspects.micro
			den.aspects.steam
			den.aspects.theme
			den.aspects.waybar

			den.aspects.theme._.selenized

			den.aspects.vesktop
			den.aspects.vscodium
			den.aspects.spotify-player
		];

		nixos = { pkgs, ... }: {
			environment.systemPackages = with pkgs; [
				
			];
		};

		homeManager = { config, pkgs, ... }: {
		
			home.packages = with pkgs; [
				#discord
				#spotify
				#zoom-us
				#prismlauncher
			];
				
			
			programs.git.enable = true;
			programs.git.settings = {
				user.name = "Azutech7";
				user.email = "masonheuberger@gmail.com";
			};

			
		};
		
	};
}
