{ inputs, den, pkgs, lib, host, ... }: {

imports = [ inputs.den.flakeModule ];

den.aspects.common.provides.hardware.provides.automatic-compatability = {

nixos = { ... }: {

hardware = {
enableAllHardware = true;
enableAllFirmware = true;
};

};

};
}

