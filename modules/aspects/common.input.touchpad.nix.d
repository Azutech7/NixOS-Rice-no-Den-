{ inputs, den, pkgs, lib, host, user, ... }: {

imports = [ inputs.den.flakeModule ];

    den.aspects.common._.input._.touchpad = {
        nixos = { ... }: {
            services.libinput.enable = true;
        };
    };
}
