{ config, pkgs, ... }:

{

  imports = [
    # Include the results of the hardware scan.
    ./configuration.nix
  ];

  hardware = {
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;
  };

  networking.interfaces.enp6s0.wakeOnLan = {
    enable = true;
    policy = [ "magic" ];
  };

  services.xserver = {
    dpi = 96;
    videoDrivers = [
      "admgpu"
    ];
  };
}
