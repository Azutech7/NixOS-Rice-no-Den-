{ inputs, den, pkgs, lib, host, user, ... }: {

imports = [ inputs.den.flakeModule ];

    den.aspects.vscodium = {
        homeManager = { pkgs, ... }: {

            programs.vscode = {
                enable = true;
                package = pkgs.vscodium;

                profiles.default.extensions = with pkgs.vscode-extensions; [
                    jnoortheen.nix-ide
                ];
            };

        };
    };
}
