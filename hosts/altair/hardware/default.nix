{ pkgs, ... }:

{

  imports = [
    # Include the results of the hardware scan.
    ./configuration.nix
    ./disk-config.nix
  ];

  environment.systemPackages = with pkgs; [
    nvtopPackages.amd
    nvtopPackages.intel
  ];

  hardware.enableRedistributableFirmware = true;

  nix.settings.max-jobs = 8;

  services = {
    hardware.openrgb.enable = true;
    xserver = {
      dpi = 96;
      videoDrivers = [ "amdgpu" ];
    };
  };
}
