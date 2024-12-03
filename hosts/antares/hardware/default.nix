{ config, pkgs, ... }:

{

  imports = [
    # Include the results of the hardware scan.
    ./configuration.nix
  ];

  hardware = {
    enableRedistributableFirmware = true;
    nvidia.open = false;
  };

  nix.settings.max-jobs = 4;

  powerManagement.cpuFreqGovernor = "performance";

  services.xserver = {
    dpi = 96;
    videoDrivers = [ "nvidia" ];
  };
}
