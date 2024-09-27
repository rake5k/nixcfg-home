# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, modulesPath, pkgs, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot = {
    initrd = {
      availableKernelModules = [ "ohci_pci" "ehci_pci" "ahci" "firewire_ohci" "usb_storage" "usbhid" "sd_mod" "sr_mod" ];
      kernelModules = [ ];
      luks.devices.root.device = "/dev/disk/by-partlabel/root";
    };
    kernelModules = [ "kvm-intel" "wl" ];
    extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/root";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

    "/home" = {
      device = "/dev/disk/by-label/root";
      fsType = "btrfs";
      options = [ "subvol=@home" ];
    };

    "/nix" = {
      device = "/dev/disk/by-label/root";
      fsType = "btrfs";
      options = [ "subvol=@nix" ];
    };

    "/swap" = {
      device = "/dev/disk/by-label/root";
      fsType = "btrfs";
      options = [ "subvol=@swap" ];
    };

    "/boot" = {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
    };
  };

  swapDevices = [{
    device = "/swap/swapfile";
    size = 4 * 1024;
    randomEncryption.enable = true;
  }];

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
