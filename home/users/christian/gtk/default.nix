{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let

  cfg = config.custom.home.gtk;

in

{
  options = {
    custom.home.gtk = {
      enable = mkEnableOption "GTK";
    };
  };

  config = mkIf cfg.enable { gtk.gtk3.bookmarks = [ "file:///mnt/home Home SMB" ]; };
}
