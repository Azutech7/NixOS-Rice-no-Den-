{ inputs, den, pkgs, lib, host, user, ... }: {

imports = [ inputs.den.flakeModule ];

    den.aspects.flatpak = {
        nixos = { ... }: {
            services.flatpak.enable = true;
        };
    };
}
