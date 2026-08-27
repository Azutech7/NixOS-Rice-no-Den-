{ inputs, den, pkgs, lib, host, user, ... }: {

imports = [ inputs.den.flakeModule ];

    den.aspects.steam = {
        nixos = { pkgs, ... }: {
            programs.steam = {
		    	enable = true;

		    	remotePlay.openFirewall = true;
		    	dedicatedServer.openFirewall = true;

            	gamescopeSession.enable = true;

            	extraCompatPackages = with pkgs; [
            		proton-ge-bin
            	];
            };
        };
    };
}
