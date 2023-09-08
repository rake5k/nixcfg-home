{
  description = "NixOS & Home-Manager Configuration - Home Flavor";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixcfg.url = "github:christianharke/nixcfg";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nixcfg, ... } @ inputs:
    let
      nixcfgLib = nixcfg.lib { inherit inputs; };

      inherit (inputs.flake-utils.lib.system) x86_64-linux;
      inherit (nixpkgs.lib) listToAttrs recursiveUpdate;
    in
    with nixcfgLib;
    recursiveUpdate nixcfg {

      nixosConfigurations = listToAttrs [
        (mkNixos x86_64-linux "altair")
        (mkNixos x86_64-linux "antares")
      ];

      checks = mkForEachSystem [
        (mkBuild "build" self.nixosConfigurations.altair.config.system.build.toplevel)
        (mkBuild "build" self.nixosConfigurations.antares.config.system.build.toplevel)
      ];
    };
}
