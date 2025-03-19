{ pkgs, ... }:

let

  PL2770H-DP = "IVM-26206-68-PL2770H-";
  PL3466WQ = "IVM-30248-0-PL3466WQ-1174031001065";

in

{
  custom.roles.desktop.xserver.grobi = {
    enable = true;
    fallbackOutput = "DisplayPort-1";
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
        outputs_connected = [ "DisplayPort-1-${PL2770H-DP}" ];
        outputs_disconnected = [ "HDMI-A-1-1" ];
        configure_single = "DisplayPort-1";
        primary = "DisplayPort-1";
        atomic = false;
        execute_after = [
          "${pkgs.xorg.xrandr}/bin/xrandr --output DisplayPort-1 --mode 1920x1080 --rate 165"
        ];
      }
      {
        name = "DP-Desk-Extended";
        outputs_connected = [
          "DisplayPort-1-${PL2770H-DP}"
          "HDMI-A-1-1"
        ];
        outputs_disconnected = [ ];
        configure_row = [
          "DisplayPort-1"
          "HDMI-A-1-1"
        ];
        primary = "DisplayPort-1";
        atomic = false;
        execute_after = [
          "${pkgs.xorg.xrandr}/bin/xrandr --output DisplayPort-1 --mode 1920x1080 --rate 165"
        ];
      }
      {
        name = "DP-Simrig";
        outputs_connected = [ "DisplayPort-0-${PL3466WQ}" ];
        outputs_disconnected = [ "DisplayPort-1-${PL2770H-DP}" ];
        configure_single = "DisplayPort-0";
        primary = "DisplayPort-0";
        atomic = false;
      }
      {
        name = "HDMI";
        outputs_connected = [ "HDMI-A-1-1" ];
        outputs_disconnected = [ ];
        configure_single = "HDMI-A-1-1";
        primary = "HDMI-A-1-1";
        atomic = false;
      }
    ];
  };
}
