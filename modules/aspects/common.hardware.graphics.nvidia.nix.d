{ inputs, den, ... }: {

imports = [ inputs.den.flakeModule ];

	den.aspects.common._.hardware._.graphics._.nvidia = {

		nixos = { ... }: {
			hardware.graphics.enable = true;

			hardware.nvidia = {
				open = true;
				modesetting.enable = true;
				nvidiaSettings = true;
			};

			services.xserver.videoDrivers = [ "nvidia" ];
		};
			
	};
}
