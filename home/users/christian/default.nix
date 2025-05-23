{ config, lib, ... }:

let

  programsCfg = config.custom.programs;
  rolesCfg = config.custom.roles;
  userCfg = config.custom.users.christian;
  cfg = config.custom.home;

  inherit (lib) mkEnableOption mkIf;

in

{
  options = {
    custom.home = {
      enable = mkEnableOption "Home environment";
    };
  };

  config = mkIf cfg.enable {

    custom = {
      base.non-nixos.home-manager.autoUpgrade.flake = "github:rake5k/nixcfg-home";

      home = {
        firefox.enable = programsCfg.firefox.enable;
        git.enable = userCfg.git.enable;
        gtk.enable = rolesCfg.desktop.enable;
        office.cli.enable = rolesCfg.office.cli.enable;
        polybar.enable = rolesCfg.desktop.xserver.polybar.enable;
        web.enable = rolesCfg.web.enable;
        xmonad.enable = rolesCfg.desktop.xserver.xmonad.enable;
      };
    };
  };
}
