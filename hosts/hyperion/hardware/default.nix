{ inputs, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./configuration.nix
    ./disk-config.nix

    # nixos-hardware
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia-nonprime
  ];

  environment.systemPackages = with pkgs; [
    openseachest
  ];

  # See: https://github.com/NixOS/nixos-hardware/issues/348#issuecomment-997123102
  hardware.nvidia = {
    open = true;
    powerManagement.enable = true;
    nvidiaPersistenced = true;
  };
}
