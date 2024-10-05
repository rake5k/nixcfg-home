{ config, lib, pkgs, ... }:

let

  PL2770H-HDMI = "IVM-26205-68-PL2770H-";
  PL2770H-DP = "IVM-26206-68-PL2770H-";
  PL3466WQ = "IVM-30248-0-PL3466WQ-1174031001065";

in

{
  custom.roles.desktop.xserver.grobi = {
    enable = true;
    fallbackOutput = "DP-1";
    rules = [
      # Does not work with my KVM switch / graphics card combo, unfortunately:
      #{
      #  name = "HDMI-Desk";
      #  outputs_connected = [ "HDMI-0-${PL2770H-HDMI}" ];
      #  outputs_disconnected = [ ];
      #  configure_single = "HDMI-0";
      #  primary = "HDMI-0";
      #  atomic = false;
      #}
      {
        name = "DP-Desk";
        outputs_connected = [ "DP-1-${PL2770H-DP}" ];
        outputs_disconnected = [ "HDMI-0" ];
        configure_single = "DP-1";
        primary = "DP-1";
        atomic = false;
        execute_after = [
          "${pkgs.xorg.xrandr}/bin/xrandr --output DP-1 --mode 1920x1080 --rate 165"
        ];
      }
      {
        name = "DP-Desk-Extended";
        outputs_connected = [ "DP-1-${PL2770H-DP}" "HDMI-0" ];
        outputs_disconnected = [ ];
        configure_row = [ "DP-1" "HDMI-0" ];
        primary = "DP-1";
        atomic = false;
        execute_after = [
          "${pkgs.xorg.xrandr}/bin/xrandr --output DP-1 --mode 1920x1080 --rate 165"
        ];
      }
      {
        name = "DP-Simrig";
        outputs_connected = [ "DP-2-${PL3466WQ}" ];
        outputs_disconnected = [ "DP-1-${PL2770H-DP}" ];
        configure_single = "DP-2";
        primary = "DP-2";
        atomic = false;
      }
      {
        name = "HDMI";
        outputs_connected = [ "HDMI-0" ];
        outputs_disconnected = [ ];
        configure_single = "HDMI-0";
        primary = "HDMI-0";
        atomic = false;
      }
    ];
  };
}
