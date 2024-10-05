{ config, lib, pkgs, ... }:

let

  PL2770H = "IVM-26205-68-PL2770H-";

in

{
  custom.roles.desktop.xserver.grobi = {
    enable = true;
    fallbackOutput = "LVDS-0";
    rules = [
      {
        name = "DP-Desk-Extended";
        outputs_connected = [ "DP-0-${PL2770H}" "LVDS-0" ];
        outputs_disconnected = [ ];
        configure_row = [ "DP-0" "LVDS-0" ];
        primary = "DP-0";
        atomic = false;
      }
      {
        name = "Single";
        outputs_connected = [ "LVDS-0" ];
        outputs_disconnected = [ "DP-0" "DP-1" ];
        configure_single = "LVDS-0";
      }
    ];
  };
}
