{ pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./configuration.nix
    ./disk-config.nix
  ];

  boot = {
    # See: https://www.reddit.com/r/jellyfin/comments/ldzhhl/gpu_transcoding_issues/
    kernelModules = [
      "nvidia"
      "nvidia_modeset"
      "nvidia_drm"
      "nvidia_uvm"
    ];

    blacklistedKernelModules = [ "nouveau" ];
  };

  environment.systemPackages = with pkgs; [
    nvtopPackages.nvidia
    openseachest
  ];

  # See: https://github.com/NixOS/nixos-hardware/issues/348#issuecomment-997123102
  hardware = {
    enableRedistributableFirmware = true;
    graphics.enable = true;
    nvidia = {
      open = true;
      powerManagement.enable = true;
      nvidiaPersistenced = true;
    };
    # See: https://podman-desktop.io/docs/podman/gpu
    nvidia-container-toolkit.enable = true;
  };

  # See: https://discourse.nixos.org/t/jellyfin-hardware-encoding-error-cannot-load-libcuda-so-1/29427/5
  services.xserver.videoDrivers = [ "nvidia" ];
}
