{
  custom = {
    nix.autoUpgrade = {
      enable = true;
      flake = "github:christianharke/nixcfg-home";
    };
  };
}
