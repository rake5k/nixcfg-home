{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./configuration.nix
  ];

  services.xserver.dpi = 144;
}
