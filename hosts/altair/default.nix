{ pkgs, ... }:

{
  imports = [ ./hardware ];

  custom = {
    base = {
      users = [ "christian" ];
      system = {
        btrfs = {
          enable = true;
          btrbk.enable = true;
          impermanence.enable = true;
        };
        luks = {
          enable = true;
          remoteUnlock = true;
        };
        network.wol = {
          enable = true;
          interface = "enp6s0";
        };
      };
    };

    roles = {
      android.enable = true;
      containers.enable = true;
      desktop.enable = true;
      gaming = {
        enable = true;
        simracing.enable = true;
      };
    };
  };

  system.stateVersion = import ./state-version.nix;
}
