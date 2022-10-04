{ config, lib, ... }:

with lib;

let

  cfg = config.custom.home.firefox;

in

{
  options = {
    custom.home.firefox = {
      enable = mkEnableOption "Firefox config";
    };
  };

  config = mkIf cfg.enable {
    custom.programs.firefox.homepage = "https://harke.ch/dash/home/";
  };
}
