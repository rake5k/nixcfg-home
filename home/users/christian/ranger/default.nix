{ config, lib, ... }:

with lib;

let

  cfg = config.custom.home.ranger;

in

{
  options = {
    custom.home.ranger = {
      enable = mkEnableOption "Ranger config";
    };
  };

  config = mkIf cfg.enable {
    custom.programs.ranger = {
      bookmarks = ''
        # Home
        s:/mnt/home/home/Scan
        p:/mnt/home/public
      '';
    };
  };
}
