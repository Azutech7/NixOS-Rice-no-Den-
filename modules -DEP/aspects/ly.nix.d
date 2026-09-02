{ inputs, den, pkgs, lib, host, user, ... }: {

imports = [ inputs.den.flakeModule ];

    den.aspects.ly = {
        nixos = { ... }: {
            services.displayManager.ly.enable = true;
        };
    };
}
