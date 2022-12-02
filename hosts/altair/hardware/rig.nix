{ config, lib, pkgs, ... }:

{
  hardware = {
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;
  };

  services.xserver = {
    dpi = 96;
    videoDrivers = [
      "nvidia"
    ];
  };
}
