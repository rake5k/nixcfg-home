{ lib, ... }:

{
  custom = {
    users.christian.enable = true;
    home.enable = true;

    roles = {
      desktop = {
        enable = true;
        xserver = {
          enable = true;
          grobi.enable = lib.mkForce false;
        };
      };
      web.enable = true;
    };
  };

  home.stateVersion = import ./state-version.nix;
}
