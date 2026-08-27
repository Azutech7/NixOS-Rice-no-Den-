{ inputs, den, config, ... }: {

imports = [ inputs.den.flakeModule ];

	den.aspects.common.laptop.touchpad = {

		nixos = { ... }: 
			{
				services.libinput.enable = true;
			};
			
	};
}

#### WHY DOES THIS FILE EXIST, LOOK AT 'common.input.touchpad.nix'