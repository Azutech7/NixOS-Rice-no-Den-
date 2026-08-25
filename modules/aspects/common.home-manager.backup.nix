{ inputs, den, pkgs, lib, host, user, ... }: {

imports = [ inputs.den.flakeModule ];

    den.aspects.common._.home-manager._.backup = {
        nixos = { ... }: {
            home-manager.backupFileExtension = "bak";
            home-manager.overwriteBackup = true;
        };
    };
}
