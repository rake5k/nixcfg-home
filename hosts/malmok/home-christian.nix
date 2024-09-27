{ lib, ... }:

{
  custom = {
    users.christian.enable = true;
    home.enable = true;

    roles = {
      desktop = {
        enable = true;
        mobile.enable = true;
        xserver = {
          enable = true;
          xmonad.lightweight = true;
          grobi.enable = lib.mkForce false;
        };
      };
      multimedia = {
        enable = true;
        converters.enable = true;
      };
      web.enable = true;
    };
  };

  home.stateVersion = import ./state-version.nix;
}
