{
  description = "NixOS & Home-Manager Configuration - Home Flavor";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixcfg.url = "github:rake5k/nixcfg";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nixcfg, ... } @ inputs:
    let
      nixcfgLib = nixcfg.lib { inherit inputs; };

      inherit (inputs.flake-utils.lib.system) x86_64-linux aarch64-linux;
      inherit (nixpkgs.lib) listToAttrs recursiveUpdate;
    in
    with nixcfgLib;
    recursiveUpdate nixcfg {
      name = "nixcfg-home";

      homeConfigurations = listToAttrs [
        (mkHome x86_64-linux "deck@sirius-a")
      ];

      nixosConfigurations = listToAttrs [
        (mkNixos x86_64-linux "altair")
        (mkNixos x86_64-linux "antares")
        (mkNixos x86_64-linux "sirius-b")
      ];

      nixOnDroidConfigurations = listToAttrs [
        (mkNixOnDroid aarch64-linux "io")
      ];

      checks = mkForEachSystem [
        (mkBuild "build" self.nixosConfigurations.altair.config.system.build.toplevel)
        (mkBuild "build" self.nixosConfigurations.antares.config.system.build.toplevel)
        (mkBuild "build" self.nixosConfigurations.sirius-b.config.system.build.toplevel)
        (mkBuild "build" self.nixOnDroidConfigurations.io.activationPackage)
        (mkBuild "build-deck@sirius-a" self.homeConfigurations."deck@sirius-a".activationPackage)
      ];

      devShells = mkForEachSystem [
        (mkDevShell "default" { flake = self; })
      ];
    };
}
