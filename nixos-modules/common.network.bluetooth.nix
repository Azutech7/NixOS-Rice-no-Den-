{ inputs, config, pkgs, lib, host, user, ... }: {

	options.modules.common.network.bluetooth.enable = lib.mkEnableOption "common.network.bluetooth";

	config = lib.mkIf config.modules.common.network.bluetooth.enable {
		
		hardware.bluetooth.enable = true;
		
	};
}
