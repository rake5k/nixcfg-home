# :snowflake: Nix Configuration - Home Flavor :house:

[![NixOS][nixos-badge]][nixos]
[![Build and Test][ci-badge]][ci]

## Supported configurations

* [NixOS][nixos]-managed
  * `altair` (personal desktop)
  * `antares` (spare gaming desktop)
  * `hyperion` (home server)
  * `malmok` (legacy MacBook Pro)
  * `sirius-b` (Steam machine)
* [Nix-on-Droid][nix-on-droid]-managed
  * `io` (Android mobile)
* [Home Manager][home-manager]-managed
  * `sirius-a` (Steam Deck)

See [flake.nix](flake.nix) for more information like `system`.

For further details refer to the [README of the basic Nix Configuration Flake][nixcfg].

[ci]: https://garnix.io/repo/rake5k/nixcfg-home
[ci-badge]: https://img.shields.io/endpoint.svg?url=https%3A%2F%2Fgarnix.io%2Fapi%2Fbadges%2Frake5k%2Fnixcfg-home%3Fbranch%3Dmain

[home-manager]: https://github.com/nix-community/home-manager
[nix-on-droid]: https://nix-community.github.io/nix-on-droid
[nixos]: https://nixos.org/
[nixos-badge]: https://img.shields.io/badge/NixOS-24.11-blue.svg?logo=NixOS&logoColor=white
[nixcfg]: https://github.com/rake5k/nixcfg
