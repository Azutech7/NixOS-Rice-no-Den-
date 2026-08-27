{ inputs, den, pkgs, lib, host, ... }: {

imports = [ inputs.den.flakeModule ];

	den.aspects.common.provides.network.provides.dnscrypt-proxy = {
		nixos = { lib, ... }: {

			services.dnscrypt-proxy = {
				  enable = true;
				  settings = {
				  
				    server_names = [ "cloudflare" "quad9-dnscrypt-main" ];
				    
				    listen_addresses = [ "127.0.0.1:5353" ];

				    require_dnssec = true;
					require_nofilter = false;
				    require_nolog = true;

					ipv6_servers = false;
				};
			};

			networking = {
				nameservers = lib.mkForce [ "127.0.0.1" ];
				networkmanager.dns = lib.mkForce "none";
			};

		};
	};
}
