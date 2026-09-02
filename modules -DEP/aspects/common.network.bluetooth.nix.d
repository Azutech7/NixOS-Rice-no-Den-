{ inputs, den, pkgs, lib, host, user, ... }: {

imports = [ inputs.den.flakeModule ];

	den.aspects.common._.network._.bluetooth = {
		nixos = { ... }: {
			hardware.bluetooth.enable = true;
		};
	};
}
