{ inputs, pkgs, lib, host, config, ... }: {

    options.modules.common.hardware.automatic-compatability.enable = lib.mkEnableOption "common.hardware.automatic-compatability";

    config = lib.mkIf config.modules.common.hardware.automatic-compatability.enable {

        hardware = {
            enableAllHardware = true;
            enableAllFirmware = true;
        };

    };
}

