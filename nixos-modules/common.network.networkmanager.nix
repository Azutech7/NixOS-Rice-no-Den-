{ inputs, config, pkgs, lib, host, user, ... }: {

	options.modules.common.network.networkmanager.enable = lib.mkEnableOption "common.network.networkmanager";

	config = lib.mkIf config.modules.common.network.networkmanager.enable {

		networking = {
			networkmanager = {
				enable = true;
				wifi.macAddress = "random";
				wifi.scanMacAddress = "random";

				dns = lib.mkDefault "default";
			};

			enableIPv6 = false;
			preferIPv4 = true;

			nameservers = lib.mkDefault [ "1.1.1.1" "8.8.8.8" ];
		};

	};
}
