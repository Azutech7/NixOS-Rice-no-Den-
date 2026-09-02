{ inputs, den, ... }: {
  # Tells flake-file to track the upstream repository
  flake-file.inputs.nix-minecraft.url = "github:Infinidoge/nix-minecraft";

  den.aspects.minecraft-server = {
    # 1. Base client/system packages module hook
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        packwiz
      ];
    };

    # 2. Automated Packwiz Server Instance Constructor
    provides.mkMinecraftServer = {

      includes = [ den.aspects.minecraft-server ];

      __functor = self: { name ? "", port ? 25565, rconPort ? 25575, seed ? "", ... }: {

        nixos = { pkgs, lib, ... }: let
          # The relative path literal brings your pack.toml into the sandbox safely
          actualModpackPath = ./../../modpack-data;

          modpack = pkgs.fetchPackwizModpack { src = /. + actualModpackPath; };


          packData = builtins.fromTOML (builtins.readFile (actualModpackPath + "/pack.toml"));

          supportedLoaders = [ "neoforge" "forge" "fabric" "quilt" ];
          detectedLoaders = builtins.intersectAttrs (builtins.listToAttrs (map (name: { inherit name; value = null; }) supportedLoaders)) packData.versions;

          minecraftVersion = modpack.manifest.versions.minecraft;
          loaderName = builtins.head (builtins.attrNames detectedLoaders); # Resolves to "neoforge"
          loaderVersion = packData.versions.${loaderName};

          # FIX: Standardized version lookup formatting to map cleanly into pkgs.neoforgeServers
          serverVersion = lib.replaceStrings [ "." ] [ "_" ] "${loaderName}-${minecraftVersion}";

        in {
          imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
          nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

		networking.firewall.allowedTCPPorts = [
			25565
			25575
		]
		
          services.minecraft-servers = {
            enable = true;
            eula = true;
            openFirewall = false;

            servers.${name} = {
              enable = true;
              
              # Pulls dynamically out of pkgs.neoforgeServers
              package = pkgs."${loaderName}Servers".${serverVersion}.override { inherit loaderVersion; };

              symlinks = {
                "mods" = "${modpack}/mods";
              };
              files = {
                "config" = "${modpack}/config";
              };

              serverProperties = {
                allow-flight = true;
                broadcast-console-to-ops = true;
                broadcast-rcon-to-ops = true;
                difficulty = 3;
                enable-rcon = true;
                enable-status = true;
                enforce-secure-profile = true;
                enforce-whitelist = false;
                force-gamemode = false;
                gamemode = 0;
                generate-structures = true;
                hardcore = false;
                hide-online-players = false;
                level-name = (name + "World");
                level-seed = seed;
                log-ips = true;
                max-players = 20;
                max-tick-time = 60000;
                max-world-size = 29999984;
                motd = "bello.";
                network-compression-threshold = 256;
                online-mode = true;
                #query.port = port;
                rcon.password = "adminLogin";
                rcon.port = "25575";
                server-port = "25565";
              };
            };
          };
        };
      };
    };
  };
}
