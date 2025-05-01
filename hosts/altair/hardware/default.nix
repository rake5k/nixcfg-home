{ pkgs, inputs, ... }:

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
    hardware.openrgb = {
      enable = true;
      package = pkgs.openrgb.overrideAttrs {
        version = "experimental";
        src = inputs.openrgb-experimental;
        postPatch = ''
          patchShebangs scripts/build-udev-rules.sh
          substituteInPlace scripts/build-udev-rules.sh \
            --replace "/usr/bin/env chmod" "${pkgs.coreutils}/bin/chmod"
        '';
      };
    };
    xserver = {
      dpi = 96;
      videoDrivers = [ "amdgpu" ];
    };
  };
}
