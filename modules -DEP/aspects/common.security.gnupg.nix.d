{ inputs, den, pkgs, lib, host, user, ... }: {

imports = [ inputs.den.flakeModule ];

    den.aspects.common._.security._.gnupg = {
        nixos = { ... }: {
            programs.gnupg.agent = {
            	enable = true;
            	enableSSHSupport = true;
            };
        };
    };
}
