{ inputs, den, pkgs, lib, host, ... }: {

    imports = [ inputs.den.flakeModule ];

    den.aspects.common.provides.storage.provides.space-optimization = {

        nixos = { ... }: {
            nix = {

                gc = {
                    automatic = lib.mkDefault true;
                    dates = lib.mkDefault "03:25";
                    options = lib.mkDefault "--delete-older-than 7d";
                    persistent = lib.mkDefault true; 
                };

                settings.auto-optimise-store = true;

            };
        };

    };
}
