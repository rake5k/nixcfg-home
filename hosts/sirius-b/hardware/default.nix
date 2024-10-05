{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./configuration.nix
  ];

  hardware = {
    enableRedistributableFirmware = true;
  };

  nix.settings.max-jobs = 2;

  services = {
    fwupd.enable = true;
    xserver.dpi = 144;
  };
}
