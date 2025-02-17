{ pkgs, ... }:

{

  imports = [
    # Include the results of the hardware scan.
    ./configuration.nix
  ];

  environment.systemPackages = with pkgs; [
    nvtopPackages.amd
    nvtopPackages.intel
  ];

  hardware.enableRedistributableFirmware = true;

  nix.settings.max-jobs = 4;

  services.xserver = {
    dpi = 96;
    videoDrivers = [ "admgpu" ];
  };
}
