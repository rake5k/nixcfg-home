{ config, lib, pkgs, ... }:

let

  updateWallpapers = "${lib.getExe pkgs.feh} --no-fehbg --bg-fill --randomize ${config.custom.roles.desktop.wallpapersDir}";

in

{
  custom.roles.desktop.xserver.grobi = {
    enable = true;
    fallbackOutput = "DP-1";
    rules = [
      {
        name = "DP";
        outputs_connected = [ "DP-4-BNQ-32555-21573-ZOWIE XL LCD-5AG00657SL0" ];
        configure_single = "DP-1";
        primary = "DP-1";
        atomic = true;
        execute_after = [
          "${pkgs.xorg.xrandr}/bin/xrandr --output DP-4 --mode 1920x1080 --rate 60"
          updateWallpapers
        ];
      }
      {
        name = "HDMI";
        outputs_connected = [ "HDMI-0-BNQ-32554-21573-ZOWIE XL LCD-5AG00657SL0" ];
        configure_single = "HDMI-0";
        primary = "HDMI-0";
        atomic = true;
      }
    ];
  };
}
