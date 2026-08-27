{ inputs, den, pkgs, lib, host, user, ... }: {

imports = [ inputs.den.flakeModule ];

    den.aspects.vesktop = {
        homeManager = { ... }: {

            programs.vesktop = {
                enable = true;

                vencord.settings = {
                    autoUpdate = true;
                    autoUpdateNotification = true;
                    notifyAboutUpdates = true;

                    plugins = {
                        ClearURLs.enabled = true;
                        FixYoutubeEmbeds.enabled = true;
                    };
                };
            };

        };
    };
}
