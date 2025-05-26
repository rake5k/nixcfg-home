{
  description = "NixOS & Home-Manager Configuration - Home Flavor";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixcfg.url = "github:rake5k/nixcfg";
    nixcfg-secrets = {
      url = "github:rake5k/nixcfg-secrets?shallow=1";
      flake = false;
    };
    flake-utils.url = "github:numtide/flake-utils";
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    # GPU support in latest experimental
    # Update to stable release later
    openrgb-experimental = {
      url = "gitlab:CalcProgrammer1/OpenRGB";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixcfg,
      ...
    }@inputs:
    let
      nixcfgLib = nixcfg.lib { inherit inputs; };

      inherit (inputs.flake-utils.lib.system) x86_64-linux aarch64-linux;
      inherit (nixpkgs.lib) listToAttrs recursiveUpdate;
    in
    with nixcfgLib;
    recursiveUpdate nixcfg {
      name = "nixcfg-home";

      homeConfigurations = listToAttrs [ (mkHome x86_64-linux "deck@sirius-a") ];

      nixosConfigurations = listToAttrs [
        (mkNixos x86_64-linux "altair")
        (mkNixos x86_64-linux "antares")
        (mkNixos x86_64-linux "hyperion")
        (mkNixos x86_64-linux "malmok")
        (mkNixos x86_64-linux "sirius-b")
      ];

      nixOnDroidConfigurations = listToAttrs [ (mkNixOnDroid aarch64-linux "io") ];

      checks = recursiveUpdate nixcfg.checks (
        mkForSystem aarch64-linux [ (mkBuild "build" self.nixOnDroidConfigurations.io.activationPackage) ]
      );

      devShells = mkForEachSystem [ (mkDevShell "default" { flake = self; }) ];
    };
}
