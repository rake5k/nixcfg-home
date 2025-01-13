{

  imports = [
    # Include the results of the hardware scan.
    ./configuration.nix
  ];

  hardware.enableRedistributableFirmware = true;

  nix.settings.max-jobs = 4;

  services.xserver = {
    dpi = 96;
    videoDrivers = [ "admgpu" ];
  };
}
