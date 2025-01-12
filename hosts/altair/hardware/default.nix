{

  imports = [
    # Include the results of the hardware scan.
    ./configuration.nix
  ];

  hardware = {
    enableRedistributableFirmware = true;
  };

  networking.interfaces.enp6s0.wakeOnLan = {
    enable = true;
    policy = [ "magic" ];
  };

  nix.settings.max-jobs = 4;

  services.xserver = {
    dpi = 96;
    videoDrivers = [ "admgpu" ];
  };
}
