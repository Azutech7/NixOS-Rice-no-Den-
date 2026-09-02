{ inputs, den, pkgs, lib, host, ... }: {
    
	imports = [ inputs.den.flakeModule ];

	den.hosts.x86_64-linux.sanbar = {
        fileSystems."/boot" = {
            device = "/dev/disk/by-partlabel/ESP";
            fsType = "vfat";
            options = [ "umask=0077" ];
        };

        fileSystems."/" = {
            device = "/dev/disk/by-partlabel/sanbar_disko_part";
            fsType = "btrfs";
            options = [ "subvol=rootfs" ];
        };

        fileSystems."/home" = {
            device = "/dev/disk/by-partlabel/sanbar_disko_part";
            fsType = "btrfs";
            options = [ "subvol=home" "compress=zstd" ];
        };

        fileSystems."/nix" = {
            device = "/dev/disk/by-partlabel/sanbar_disko_part";
            fsType = "btrfs";
            options = [ "subvol=nix" "compress=zstd" "noatime" ];
        };

        fileSystems."/.swapvol" = {
            device = "/dev/disk/by-partlabel/sanbar_disko_part";
            fsType = "btrfs";
            options = [ "subvol=swap" ];
        };

        swapDevices = [
            { device = "/.swapvol/swapfile"; }
        ];
    };
}
