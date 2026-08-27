{ inputs, config, ... }: {

    options.modules.captive-browser.enable = lib.mkEnableOption "captive-browser";

	config = lib.mkIf config.modules.captive-browser.enable {
            
        environment.systemPackages = with pkgs; [
            captive-browser
        ];
		
	};
}
