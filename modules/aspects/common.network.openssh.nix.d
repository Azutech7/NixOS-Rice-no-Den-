{ inputs, den, pkgs, lib, host, user, ... }: {

imports = [ inputs.den.flakeModule ];

    den.aspects.common._.network._.openssh = {
        nixos = { ... }: {
            services.openssh = {
              enable = true;
              openFirewall = true;
            };
        };
    };
}
