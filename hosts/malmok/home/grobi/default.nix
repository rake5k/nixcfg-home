let

  PL2770H = "IVM-26205-68-PL2770H-";

  LVDS0 = "LVDS-0";
  DP0 = "DP-0";
  DP1 = "DP-1";

in

{
  custom.roles.desktop.xserver.grobi = {
    enable = true;
    availableOutputs = [
      LVDS0
      DP0
      DP1
    ];
    rules = [
      {
        name = "DP-Desk-Extended";
        outputs_connected = [
          "${DP1}-${PL2770H}"
          LVDS0
        ];
        outputs_disconnected = [ ];
        configure_row = [
          DP1
          LVDS0
        ];
        primary = DP1;
        atomic = false;
      }
    ];
  };
}
