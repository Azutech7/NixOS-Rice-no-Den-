{ inputs, den, pkgs, lib, host, user, ... }: {

imports = [ inputs.den.flakeModule ];

    den.aspects.common._.storage._.nixpkgs = {
        nixos = { ... }: {
            nixpkgs.config.allowUnfree = true;
        };
    };
}
