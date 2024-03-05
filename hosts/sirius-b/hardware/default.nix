{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./configuration.nix
  ];

  systemd.targets.hybrid-sleep.enable = true;

  services = {
    logind = {
      powerKey = "ignore";
      powerKeyLongPress = "poweroff";
      extraConfig = ''
        IdleAction=hybrid-sleep
        IdleActionSec=600s
      '';
    };
    xserver.dpi = 144;
  };
}
