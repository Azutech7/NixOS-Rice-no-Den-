{ inputs, config, pkgs, lib, host, user, ... }: {

    options.modules.common.network.avahi.enable = lib.mkEnableOption "common.network.avahi";

    config = lib.mkIf config.modules.common.network.avahi.enable {
        
        services.avahi = {
            enable = true;
            nssmdns4 = true;
        };

    };
}
