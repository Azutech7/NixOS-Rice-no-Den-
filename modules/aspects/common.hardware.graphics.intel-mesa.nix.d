{ inputs, den, pkgs, lib, host, user, ... }: {

imports = [ inputs.den.flakeModule ];

    den.aspects.common._.hardware._.graphics._.intel-mesa = {
        nixos = { pkgs, ... }: {
            hardware.graphics.extraPackages = with pkgs; [ intel-media-driver ];
        };
    };
}
