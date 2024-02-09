{ config, pkgs, ... }:

let

  teamspeak = config.lib.custom.nixGLWrap pkgs.teamspeak_client;

in

{
  custom = {
    base.non-nixos.enable = true;
    users.christian.enable = true;

    roles = {
      gaming.retro.enable = true;
      web.enable = true;
    };
  };

  home = {
    packages = [
      teamspeak
    ];
    username = "deck";
    stateVersion = import ./state-version.nix;
  };
}
