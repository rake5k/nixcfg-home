{
  description = "NixOS & Home-Manager Configuration - Home Flavor";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    nixcfg.url = "github:christianharke/nixcfg";
  };

  outputs = { nixpkgs, nixcfg, ... } @ inputs:
    let
      nixcfgLib = nixcfg.lib {
        inherit (inputs.nixcfg) inputs;
        rootPath = ./.;
      };

      inherit (nixpkgs.lib) listToAttrs;
      inherit (nixcfgLib) mkHome mkNixos;
    in
    {
      inherit (nixcfg) apps checks devShell;

      nixosConfigurations = listToAttrs [
        (mkNixos "x86_64-linux" "altair")
      ];
    };
}
