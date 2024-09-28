{ lib, ... }:

{
  custom = {
    users.christian.enable = true;
    home.enable = true;

    roles = {
      desktop = {
        enable = true;
        mobile.enable = true;
        xserver = {
          enable = true;
          polybar.monitors.temperature-source = "/sys/devices/pci0000:00/0000:00:0c.0/0000:02:00.0/hwmon/hwmon4/temp1_input";
          xmonad.lightweight = true;
        };
      };
      multimedia = {
        enable = true;
        converters.enable = true;
      };
      web.enable = true;
    };
  };

  home.stateVersion = import ./state-version.nix;
}
