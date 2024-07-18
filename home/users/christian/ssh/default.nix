{ config, lib, ... }:

with lib;

let

  cfg = config.custom.home.ssh;

in

{
  options = {
    custom.programs.home.ssh = {
      enable = mkEnableOption "SSH home config";
    };
  };

  config = mkIf cfg.enable {
    programs.ssh = {
      addKeysToAgent = "yes";
      controlMaster = "auto";
      controlPath = "~/.ssh/master-%r@%n:%p";
      controlPersist = "10m";
    };
  };
}
