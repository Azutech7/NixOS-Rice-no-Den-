{ inputs, den, pkgs, lib, host, user, ... }: {

imports = [ inputs.den.flakeModule ];

    den.aspects.common._.network._.printing = {
        nixos = { pkgs, ... }: {
            services.printing = {
            	enable = true;
            	drivers = with pkgs; [
            		gutenprint
            		hplip
            	];
            };
        };
    };
}
