{ inputs, den, pkgs, lib, host, user, ... }: {

imports = [ inputs.den.flakeModule ];

    den.aspects.wayland-clipboard = {
        
        nixos = { pkgs, ... }: {

            xdg.portal = {
                enable = true;
                wlr.enable = true;
                extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
            };

        };

        homeManager = { pkgs, ... }: {

            home.packages = with pkgs; [
                wl-clipboard
            ];

            services.cliphist = {
                enable = true;
                allowImages = true;
            };

        };
    };
}
