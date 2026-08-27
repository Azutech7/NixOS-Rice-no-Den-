{ inputs, pkgs, lib, host, config, ... }: {

    options.modules.common.hardware.graphics.enable = lib.mkEnableOption "common.hardware.graphics";

    config = lib.mkIf config.modules.common.hardware.graphics.enable {
         
            hardware.graphics.enable = true;
            hardware.graphics.enable32Bit = true;

    };
}
