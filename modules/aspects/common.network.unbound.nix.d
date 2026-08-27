{ inputs, den, pkgs, lib, host, ... }: {

imports = [ inputs.den.flakeModule ];

	den.aspects.common.provides.network.provides.unbound = {
		nixos = { lib, ... }: {

			services.unbound = {
				enable = true;
				enableRootTrustAnchor = true;
				
				settings = {
					server = {
						interface = [ "127.0.0.1" ];
						port = 53;
						access-control = [ "127.0.0.0/8 allow" ];
						
						do-ip4 = true;
						do-ip6 = false;
						prefetch = true;
						harden-dnssec-stripped = true;
						qname-minimisation-strict = true;

						do-not-query-localhost = false;
					};

					forward-zone = [{
						name = ".";
						forward-addr = [ "127.0.0.1@5353" ];
					}];
				};
			};

			
			networking = {
				nameservers = lib.mkForce [ "127.0.0.1" ];
				networkmanager.dns = lib.mkForce "none";
			};

			services.resolved.enable = lib.mkForce false;

		};
	};
}
