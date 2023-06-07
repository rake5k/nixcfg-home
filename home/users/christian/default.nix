{ config, lib, ... }:

with lib;

let

  programsCfg = config.custom.programs;
  rolesCfg = config.custom.roles;
  userCfg = config.custom.users.christian;
  cfg = config.custom.home;

in

{
  options = {
    custom.home = {
      enable = mkEnableOption "Home environment";
    };
  };

  config = mkIf cfg.enable {

    custom = {
      home = {
        firefox.enable = programsCfg.firefox.enable;
        git.enable = userCfg.git.enable;
        gtk.enable = rolesCfg.desktop.enable;
        office.cli.enable = rolesCfg.office.cli.enable;
        xmonad.enable = programsCfg.xmonad.enable;
      };
    };
  };
}
