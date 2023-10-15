{ config, lib, ... }:

with lib;

let

  cfg = config.custom.home.polybar;

in

{
  options = {
    custom.home.polybar = {
      enable = mkEnableOption "Polybar config";
    };
  };

  config = mkIf cfg.enable {
    custom.roles.homeage.secrets = [ "owm-key" ];
  };
}
