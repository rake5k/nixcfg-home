{ config, pkgs, ... }:

{
  imports = [ ./hardware ];

  custom = {
    base.users = [ "christian" ];

    roles = {
      desktop.enable = true;
    };
  };

  services = {
    fwupd.enable = true;
    thermald.enable = true;
    tlp.enable = true;
  };

  system.stateVersion = import ./state-version.nix;
}
