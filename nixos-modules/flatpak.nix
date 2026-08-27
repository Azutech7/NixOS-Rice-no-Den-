{ inputs, config, pkgs, lib, host, user, ... }: {

    options.modules.flatpak.enable = lib.mkEnableOption "flatpak";

    config = lib.mkIf config.modules.flatpak.enable {

        services.flatpak.enable = true;

    };
}
