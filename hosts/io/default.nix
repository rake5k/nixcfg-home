{ config, pkgs, ... }:

{
  system.stateVersion = import ./state-version.nix;
}
