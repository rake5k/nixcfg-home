{ config, pkgs, ... }:

{
  imports = [ ./hardware ];

  custom = {
    base.users = [ "christian" ];

    roles = {
      android.enable = true;
      containers.enable = true;
      desktop.enable = true;
      gaming.enable = true;
    };
  };

  boot = {
    # Use the systemd-boot EFI boot loader.
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # Update kernel from stable because of black screen on boot
    kernelPackages = pkgs.linuxPackages_latest;
  };

  services.fwupd.enable = true;

  system.stateVersion = import ./state-version.nix;
}
