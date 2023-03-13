{ config, lib, pkgs, ... }:

let

  updateWallpapers = "${lib.getExe pkgs.feh} --no-fehbg --bg-fill --randomize ${config.custom.roles.desktop.wallpapersDir}";

in

{
  custom.roles.desktop.grobi = {
    rules = [
      {
        name = "DP-Simrig";
        outputs_connected = [ "DP-2-IVM-26206-68-PL2770H-" ];
        outputs_disconnected = [ "DVI-I-0" "DVI-I-1" "DP-0" "DP-1" "DP-3" "DP-4" ];
        configure_single = "DP-2";
        primary = "DP-2";
        atomic = true;
        execute_after = [
          "${pkgs.xorg.xrandr}/bin/xrandr --output DP-2 --mode 1920x1080 --rate 165"
          updateWallpapers
        ];
      }
      {
        name = "DP-Simrig-mirrored";
        outputs_connected = [ "DP-2-IVM-26206-68-PL2770H-" "DP-4-BNQ-32555-21573-ZOWIE XL LCD-5AG00657SL0" ];
        outputs_disconnected = [ "DVI-I-0" "DVI-I-1" "DP-0" "DP-1" "DP-3" ];
        configure_row = [ "DP-2" "DP-4" ];
        primary = "DP-2";
        atomic = true;
        execute_after = [
          "${pkgs.xorg.xrandr}/bin/xrandr --output DP-2 --mode 1920x1080 --rate 144 --output DP-4 --same-as DP-2"
          "${pkgs.coreutils}/bin/sleep 1"
          "${pkgs.xorg.xrandr}/bin/xrandr --output DP-2 --mode 1920x1080 --rate 144 --output DP-4 --same-as DP-2"
          updateWallpapers
        ];
      }
      {
        name = "DP-Desk";
        outputs_connected = [ "DP-4-BNQ-32555-21573-ZOWIE XL LCD-5AG00657SL0" ];
        outputs_disconnected = [ "DVI-I-0" "DVI-I-1" "DP-0" "DP-1" "DP-2" "DP-3" ];
        configure_single = "DP-4";
        primary = "DP-4";
        atomic = true;
        execute_after = [
          "${pkgs.xorg.xrandr}/bin/xrandr --output DP-4 --mode 1920x1080 --rate 144"
          updateWallpapers
        ];
      }
      {
        name = "HDMI-Desk";
        outputs_connected = [ "HDMI-0-BNQ-32554-21573-ZOWIE XL LCD-5AG00657SL0" ];
        outputs_disconnected = [ "DVI-I-0" "DVI-I-1" "DP-0" "DP-1" "DP-2" "DP-3" "DP-4" ];
        configure_single = "HDMI-0";
        primary = "HDMI-0";
        atomic = true;
      }
      {
        name = "Fallback";
        configure_single = "DP-4";
      }
    ];
  };
}
