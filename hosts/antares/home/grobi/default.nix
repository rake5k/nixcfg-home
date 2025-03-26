{ lib, pkgs, ... }:

let

  inherit (lib) getExe;

  ZOWIE-XL-LCD-DP = "BNQ-32555-21573-ZOWIE XL LCD-5AG00657SL0";
  ZOWIE-XL-LCD-HDMI = "BNQ-32554-21573-ZOWIE XL LCD-5AG00657SL0";

  DP1 = "DP-1";
  HDMI0 = "HDMI-0";

in

{
  custom.roles.desktop.xserver.grobi = {
    enable = true;
    availableOutputs = [ DP1 ];
    rules = [
      {
        name = "DP";
        outputs_connected = [ "${DP1}-${ZOWIE-XL-LCD-DP}" ];
        configure_single = DP1;
        primary = DP1;
        atomic = true;
        execute_after = [ "${getExe pkgs.xorg.xrandr} --output ${DP1} --mode 1920x1080 --rate 60" ];
      }
      {
        name = "HDMI";
        outputs_connected = [ "${HDMI0}-${ZOWIE-XL-LCD-HDMI}" ];
        configure_single = HDMI0;
        primary = HDMI0;
        atomic = true;
      }
    ];
  };
}
