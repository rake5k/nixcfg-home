{ config, pkgs, ... }:

{
  imports = [ ./hardware ];

  custom = {
    base.users = [ "christian" ];

    roles = {
      steambox.enable = true;
    };
  };

  boot = {
    # Use the systemd-boot EFI boot loader.
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  system.stateVersion = import ./state-version.nix;
}
