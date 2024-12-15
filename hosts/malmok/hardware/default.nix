{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./configuration.nix
  ];

  boot.kernelParams = [ "video=LVDS-1:d" ];

  environment.variables = {
    __GLX_VENDOR_LIBRARY_NAME = "mesa";
  };

  hardware = {
    enableRedistributableFirmware = true;
    graphics.enable = true;
    nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_340;
  };

  nix.settings.max-jobs = 1;

  services.xserver = {
    deviceSection = ''
      Option "NoLogo" "1"
    '';
    serverFlagsSection = ''
      Option "IgnoreABI" "1"
    '';
    videoDrivers = [ "nvidia" ];
  };
}
