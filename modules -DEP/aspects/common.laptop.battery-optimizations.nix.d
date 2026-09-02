{ inputs, den, pkgs, lib, host, ... }: {

imports = [ inputs.den.flakeModule ];

den.aspects.common.provides.laptop.provides.battery-optimizations = { ... }: {

provides.power-management = {
nixos = { ... }: {
powerManagement.enable = true;
services.thermald.enable = true;
services.tlp.enable = true;
};
};

provides.battery = {
# DO LATER
};

};
}
