{ pkgs, ... }:

let

  ZOWIE-XL-LCD-DP = "BNQ-32555-21573-ZOWIE XL LCD-5AG00657SL0";
  ZOWIE-XL-LCD-HDMI = "BNQ-32554-21573-ZOWIE XL LCD-5AG00657SL0";

in

{
  custom.roles.desktop.xserver.grobi = {
    enable = true;
    fallbackOutput = "DP-1";
    rules = [
      {
        name = "DP";
        outputs_connected = [ "DP-4-${ZOWIE-XL-LCD-DP}" ];
        configure_single = "DP-1";
        primary = "DP-1";
        atomic = true;
        execute_after = [ "${pkgs.xorg.xrandr}/bin/xrandr --output DP-4 --mode 1920x1080 --rate 60" ];
      }
      {
        name = "HDMI";
        outputs_connected = [ "HDMI-0-${ZOWIE-XL-LCD-HDMI}" ];
        configure_single = "HDMI-0";
        primary = "HDMI-0";
        atomic = true;
      }
    ];
  };
}
