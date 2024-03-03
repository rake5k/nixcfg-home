{ pkgs, ... }:

{
  custom = {
    home.enable = true;
    roles.gaming = {
      mangohud.enable = true;
      minecraft.enable = true;
    };
  };

  home.stateVersion = import ./state-version.nix;
}
