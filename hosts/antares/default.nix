{ config, pkgs, ... }:

{
  imports = [ ./hardware ];

  custom = {
    base.users = [ "christian" ];

    roles = {
      desktop.enable = true;
      gaming.enable = true;
    };
  };

  system.stateVersion = import ./state-version.nix;
}
