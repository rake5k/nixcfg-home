{ lib, ... }:

{
  imports = [ ./home/grobi ];

  custom = {
    users.christian.enable = true;
    home.enable = true;

    roles = {
      desktop = {
        enable = true;
        mobile.enable = true;
        xserver = {
          enable = true;
          polybar.monitors.temperature-source = "/sys/devices/platform/coretemp.0/hwmon/hwmon2/temp2_input";
          xbindkeys.keymap = {
            #XF86LaunchA = "launch a";
            #XF86LaunchB = "launch b";
            XF86KbdBrightnessDown = "brightnessctl set 50%- -d smc::kbd_backlight";
            XF86KbdBrightnessUp = "brightnessctl set 50%+ -d smc::kbd_backlight";
          };
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
