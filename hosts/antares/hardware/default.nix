{ config, pkgs, ... }:

{

  imports = [
    # Include the results of the hardware scan.
    ./configuration.nix
  ];

  hardware = {
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;
  };

  powerManagement.cpuFreqGovernor = "performance";

  services.xserver = {
    dpi = 96;
    videoDrivers = [
      "nvidia"
    ];
  };
}
