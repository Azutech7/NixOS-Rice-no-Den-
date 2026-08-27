{ inputs, den, pkgs, lib, host, user, ... }: {

imports = [ inputs.den.flakeModule ];

	den.aspects.common._.network._.firewall = {
		nixos = { ... }: {
			networking.firewall = {
				enable = true;
				
				allowedUDPPorts = [];
				allowedTCPPorts = [];

				checkReversePath = "strict";
				allowPing = false; 
			};
		};
	};
}
