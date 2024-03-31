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
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    # Update kernel from 6.1 because of amdgpu suspend-resuming issues
    kernelPackages = pkgs.linuxPackages_latest;
  };

  system.stateVersion = import ./state-version.nix;
}
