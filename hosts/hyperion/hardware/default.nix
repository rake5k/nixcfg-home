{ pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./configuration.nix
    ./disk-config.nix
  ];

  environment.systemPackages = with pkgs; [
    openseachest
  ];
}
