{ inputs, den, pkgs, lib, host, ... }: {
	imports = [ inputs.den.flakeModule ];

	den.hosts.x86_64-linux.atlas = {

		includes = [
			(den.aspects.common._.storage._.disko._.mkPrimaryDrive { 
				devicePath = "/dev/disk/by-id/wwn-0x5001b448b8653de0";
			})
			den.aspects.common._.audio._.pipewire
			den.aspects.common._.boot
			den.aspects.common._.hardware._.automatic-compatability
			den.aspects.common._.hardware._.graphics._.intel-mesa
			den.aspects.common._.hardware._.graphics
			den.aspects.common._.home-manager._.backup
			den.aspects.common._.network._.avahi
			den.aspects.common._.network._.bluetooth
			den.aspects.common._.network._.unbound
			den.aspects.common._.network._.firewall
			den.aspects.common._.network._.dnscrypt-proxy
			den.aspects.common._.network._.networkmanager
			den.aspects.common._.network._.openssh
			den.aspects.common._.security._.gnupg
			den.aspects.common._.security._.pam
			den.aspects.common._.storage._.nixpkgs
			den.aspects.common._.storage._.space-optimization
		];

		users = {
			server-manager = {};
		};



		environment.systemPackages = with pkgs; [
				wget
				git
				neovim
				kitty
				kdePackages.qtsvg
				kdePackages.kio
				kdePackages.kio-fuse
				kdePackages.dolphin
				kdePackages.filelight
				yazi
				tdf
				wl-clipboard
				cliphist
				hyprshot
				btop
				fuzzel
				waybar
				unzip
				p7zip
				brightnessctl
				cava
				fzf
				hyprpaper
				libgcc
				xclip
				gcc
				playerctl
				micro
				fastfetch
				pavucontrol
				tree
				bluetui
				wiremix
				parted
				android-tools
				aapt
				android-studio
				protonup-qt
				steam-run
				cacert
				openssl
			];


#			fonts.packages = with pkgs; [
#				maple-mono.truetype
#				maple-mono.NF-unhinted
#			];
#
#			fonts.fontconfig.defaultFonts = {
#				serif = [ "Maple Mono" ];
#				sansSerif = [ "Maple Mono" ];
#				monospace = [ "Maple Mono" ];
#			};

	};
}
