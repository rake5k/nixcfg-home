{ config, lib, ... }:

let

  cfg = config.custom.home.web;

  inherit (lib) mkEnableOption mkIf;

in

{
  options = {
    custom.home.web = {
      enable = mkEnableOption "Web config";
    };
  };

  config = mkIf cfg.enable {
    custom.roles.web.nextcloud-client.enable = true;
  };
}
