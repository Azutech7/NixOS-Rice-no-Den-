{ inputs, config, pkgs, lib, host, user, ... }: {

	options.modules.common.network.firewall.enable = lib.mkEnableOption "common.network.firewall";

	config = lib.mkIf config.modules.common.network.firewall.enable {
	
		networking.firewall = {
			enable = true;
			
			allowedUDPPorts = [];
			allowedTCPPorts = [];

			checkReversePath = "strict";
			allowPing = false; 
		};

	};
}
