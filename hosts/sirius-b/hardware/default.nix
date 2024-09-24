{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./configuration.nix
  ];

  hardware = {
    enableRedistributableFirmware = true;
  };

  services = {
    fwupd.enable = true;
    xserver.dpi = 144;
  };
}
