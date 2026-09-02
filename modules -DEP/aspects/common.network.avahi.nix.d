{ inputs, den, pkgs, lib, host, user, ... }: {

imports = [ inputs.den.flakeModule ];

    den.aspects.common._.network._.avahi = {
        nixos = { ... }: {
            services.avahi = {
            	enable = true;
            	nssmdns4 = true;
            };
        };
    };
}
