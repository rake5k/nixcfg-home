{ lib, pkgs, ... }:

let

  inherit (lib) getExe;

  PL2770H-HDMI = "IVM-26205-68-PL2770H-";
  PL2770H-DP = "IVM-26206-68-PL2770H-";
  PL3466WQ = "IVM-30248-0-PL3466WQ-1174031001065";

  GPU-DP0 = "DisplayPort-0";
  GPU-DP1 = "DisplayPort-1";
  GPU-DP2 = "DisplayPort-2";
  GPU-HDMI = "HDMI-A-0";
  MB-DP = "DisplayPort-1-3";
  MB-HDMI = "HDMI-1-1";

in

{
  custom.roles.desktop.xserver.grobi = {
    enable = true;
    availableOutputs = [
      GPU-DP0
      GPU-DP1
      GPU-DP2
      GPU-HDMI
      MB-DP
      MB-HDMI
    ];
    rules = [
      {
        name = "Desk-HDMI";
        outputs_connected = [ "${GPU-HDMI}-${PL2770H-HDMI}" ];
        outputs_disconnected = [ ];
        configure_single = GPU-HDMI;
        primary = GPU-HDMI;
        atomic = false;
        execute_after = [
          "${getExe pkgs.xorg.xrandr} --output ${GPU-HDMI} --mode 1920x1080 --rate 60"
        ];
      }
      {
        name = "Desk-DP";
        outputs_connected = [ "${GPU-DP1}-${PL2770H-DP}" ];
        outputs_disconnected = [ GPU-HDMI ];
        configure_single = GPU-DP1;
        primary = GPU-DP1;
        atomic = false;
        execute_after = [
          "${getExe pkgs.xorg.xrandr} --output ${GPU-DP1} --mode 1920x1080 --rate 165"
        ];
      }
      {
        name = "Desk-Extended-HDMI";
        outputs_connected = [
          "${GPU-HDMI}-${PL2770H-HDMI}"
          MB-HDMI
        ];
        outputs_disconnected = [ ];
        configure_row = [
          GPU-HDMI
          MB-HDMI
        ];
        primary = GPU-HDMI;
        atomic = false;
        execute_after = [
          "${getExe pkgs.xorg.xrandr} --output ${GPU-HDMI} --mode 1920x1080 --rate 60"
        ];
      }
      {
        name = "Desk-Extended-DP";
        outputs_connected = [
          "${GPU-DP1}-${PL2770H-DP}"
          MB-HDMI
        ];
        outputs_disconnected = [ ];
        configure_row = [
          GPU-DP1
          MB-HDMI
        ];
        primary = GPU-DP1;
        atomic = false;
        execute_after = [
          "${getExe pkgs.xorg.xrandr} --output ${GPU-DP1} --mode 1920x1080 --rate 165"
        ];
      }
      {
        name = "Simrig";
        outputs_connected = [ "${GPU-DP0}-${PL3466WQ}" ];
        outputs_disconnected = [ "${GPU-HDMI}-${PL2770H-HDMI}" ];
        configure_single = GPU-DP0;
        primary = GPU-DP0;
        atomic = false;
        execute_after = [
          "${getExe pkgs.xorg.xrandr} --output ${GPU-DP0} --mode 1920x1080 --rate 144"
        ];
      }
    ];
  };
}
