{ inputs, pkgs, lib, host, config, ... }: {

	options.modules.common.boot.enable = lib.mkEnableOption "common.boot";

    config = lib.mkIf config.modules.common.boot.enable {

        boot = {
            hardwareScan = true;
            kernelPackages = pkgs.linuxPackages_latest;
            kernelModules = [ "kvm-intel" ];
            supportedFilesystems = lib.mkForce [ 
                "btrfs"
                "reiserfs"
                "vfat"
                "f2fs"
                "xfs"
                "ntfs"
                "ext4"
                "squashfs"
                "exfat"
                #"zfs"
                "bcachefs"
                "ext2"
                "ext3"
                "jfs" 
            ];
            extraModulePackages = [ ];

            loader = {
                efi = {
                    canTouchEfiVariables = true;
                };

                systemd-boot = {
                    enable = true;
                    editor = false;
                    configurationLimit = 5;
                };

                grub.enable = false;
            };

            initrd = {
                includeDefaultModules = true;

                supportedFilesystems = lib.mkForce [
                    "vfat"
                    "ext4"
                    #"zfs"
                    "btrfs"
                ];

                availableKernelModules = [
                    "xhci_pci"
                    "ahci"
                    "xhci_pci_renesas"
                    "nvme"
                    "usbhid"
                ];

                kernelModules = [ "dm-snapshot" ];
            };
        };

	};
}

