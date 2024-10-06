{ inputs, ...}:

{
  custom = {
    base.agenix.secretsBasePath = "${inputs.nixcfg-secrets}/nixos";
    nix.autoUpgrade = {
      enable = true;
      flake = "github:christianharke/nixcfg-home";
    };
  };
}
