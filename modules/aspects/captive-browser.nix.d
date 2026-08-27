{ inputs, den, config, ... }: {

imports = [ inputs.den.flakeModule ];

	den.aspects.captive-browser = {

		nixos = { pkgs, ... }: {
            
            environment.systemPackages = with pkgs; [
                captive-browser
            ];

        };
		
	};
}
