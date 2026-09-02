{ inputs, den, lib, config, ... }: {

  imports = [ inputs.den.flakeModule ];

  # Use the schema approach to inherit attributes dynamically from the host context
  den.schema.host = host: {
    nixos = { lib, ... }: {
      system.stateVersion = "25.11";
      nixpkgs.config.allowUnfree = true;
      nix.settings.experimental-features = [ "nix-command" "flakes" ];

      den.nixpkgs = {
        source = inputs.nixpkgs;
        system = host.system; # Cleanly resolves to "x86_64-linux" automatically via context
        config.allowUnfree = true;
      };
      
      time.timeZone = lib.mkDefault "America/Los_Angeles";
    };
  };
}
