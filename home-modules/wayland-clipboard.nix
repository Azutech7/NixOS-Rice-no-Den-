{ inputs, pkgs, lib, host, user, ... }: {

    options.modules.wayland-clipboard.enable = lib.mkEnableOption "wayland-clipboard";

    config = lib.mkIf config.modules.wayland-clipboard.enable {

        home.packages = with pkgs; [
            wl-clipboard
        ];

        services.cliphist = {
            enable = true;
            allowImages = true;
        };

    };
}
