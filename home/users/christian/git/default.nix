{ config, lib, ... }:

with lib;

let

  cfg = config.custom.home.git;

in

{
  options = {
    custom.home.git = {
      enable = mkEnableOption "Git config";
    };
  };

  config = mkIf cfg.enable {
    programs.git = {
      userEmail = "christian@harke.ch";
    };
  };
}
