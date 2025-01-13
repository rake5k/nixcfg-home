{ pkgs, ... }:

{
  imports = [ ./hardware ];

  custom = {
    base = {
      users = [ "christian" ];
      system = {
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
      gaming.enable = true;
    };
  };

  # Update kernel from stable because of black screen on boot
  boot.kernelPackages = pkgs.linuxPackages_latest;

  system.stateVersion = import ./state-version.nix;
}
