{ config, lib, ... }:

with lib;

let

  cfg = config.custom.home.office.cli;

  calendarsPath = "${config.xdg.dataHome}/calendars";

in

{
  options = {
    custom.home.office.cli = {
      enable = mkEnableOption "CLI office config";
    };
  };

  config = mkIf cfg.enable {
    custom.roles.office.cli = {
      khal.extraConfig = ''
        [calendars]

        [[private]]
        path = ${calendarsPath}/nextcloud/personal
        color = dark red

        [[family]]
        path = ${calendarsPath}/nextcloud/family
        color = light blue

        [default]
        highlight_event_days = True
        default_calendar = private
      '';
    };
  };
}
