{
  description = "Loris' NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
    }@inputs:
    let
      overlays = [];
      mkSystem = import ./lib/mksystem.nix {
        inherit overlays nixpkgs home-manager;
      };
      registry = import ./lib/registry.nix;
    in
    # make configuration for each entry in registry.configs
    # this returns attr set w/ nixosConfigurations.${machine} = mkSystem {inherit machine user OS} for each {machine user OS} in registry.configs
    builtins.listToAttrs (
      builtins.map (entry: {
        name = "nixosConfigurations." + entry.machine;
        value = mkSystem entry;
      }) registry.configs
    );
}
