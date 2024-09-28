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
    thermald.enable = true;
    tlp.enable = true;
  };

  system.stateVersion = import ./state-version.nix;
}
