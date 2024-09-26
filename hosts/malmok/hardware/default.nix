{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./configuration.nix
  ];

  boot.kernelParams = [
    "video=LVDS-1:d"
  ];

  hardware = {
    enableRedistributableFirmware = true;
  };
}
