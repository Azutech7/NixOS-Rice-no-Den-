{ inputs, den, pkgs, lib, host, user, ... }: {

imports = [ inputs.den.flakeModule ];

    den.aspects.common._.security._.pam = {
        nixos = { ... }: {
            security.pam.loginLimits = [
            	{ domain = "*"; type = "soft"; item = "nofile"; value = "1048576"; }
            	{ domain = "*"; type = "hard"; item = "nofile"; value = "1048576"; }
            ];
        };
    };
}
