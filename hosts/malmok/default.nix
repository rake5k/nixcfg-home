{ config, pkgs, ... }:

{
  imports = [
    ./hardware
    ./wireguard
  ];

  custom = {
    base.users = [ "christian" ];

    roles = {
      desktop = {
        enable = true;
        mobile.enable = true;
      };
    };
  };

  system.stateVersion = import ./state-version.nix;
}
