{
  description = "NixOS & Home-Manager Configuration - Home Flavor";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixcfg.url = "github:christianharke/nixcfg";
  };

  outputs = { self, nixpkgs, nixcfg, ... } @ inputs:
    let
      nixcfgLib = nixcfg.lib { inherit inputs; };

      inherit (nixpkgs.lib) listToAttrs recursiveUpdate;
      inherit (nixcfgLib) mkHome mkNixos;
    in
    recursiveUpdate nixcfg {

      nixosConfigurations = listToAttrs [
        (mkNixos "x86_64-linux" "altair")
      ];

      checks = {
        x86_64-linux = {
          build = self.nixosConfigurations.altair.config.system.build.toplevel;
        };
      };
    };
}
