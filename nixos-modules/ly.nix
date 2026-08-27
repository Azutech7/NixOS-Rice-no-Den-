{ inputs, config, pkgs, lib, host, user, ... }: {

    options.modules.ly.enable = lib.mkEnableOption "ly";

    config = lib.mkIf config.modules.ly.enable {

        services.displayManager.ly.enable = true;

    };
}
