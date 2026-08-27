{ inputs, config, pkgs, lib, host, user, ... }: {

	options.modules.common.network.security.firewall.enable = lib.mkEnableOption "common.network.security.firewall";

	config = lib.mkIf config.modules.common.network.security.firewall.enable {
	
		networking.firewall = {
			enable = true;
			
			allowedUDPPorts = [];
			allowedTCPPorts = [];

			checkReversePath = "strict";
			allowPing = false; 
		};

	};
}
