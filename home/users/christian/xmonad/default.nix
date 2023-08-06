{ config, lib, ... }:

with lib;

let

  cfg = config.custom.home.xmonad;

in

{
  options = {
    custom.home.xmonad = {
      enable = mkEnableOption "Xmonad config";
    };
  };

  config = mkIf cfg.enable {
    custom.programs.xmonad = {
      autoruns = {
        "firefox" = 3;
      };
    };
  };
}
