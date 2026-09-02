{ inputs, den, pkgs, lib, host, user, ... }: {

imports = [ inputs.den.flakeModule ];

    den.aspects.common._.audio._.pipewire = {
        nixos = { pkgs, ... }: {

            services.pipewire = {
            	enable = true;
            	pulse.enable = true;
            };

            environment.systemPackages = with pkgs; [
                wiremix
            ];
        };

    };
}
