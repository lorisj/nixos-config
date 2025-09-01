{
  description = "Loris' NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #neovim-nightly-overlay = {
    #  url = "github:nix-community/neovim-nightly-overlay";
    #};
    nvf = {
      url = "github:lorisj/nvf?ref=stable"; # pin to stable release
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs =    {
      self,
      nixpkgs,
      home-manager,
      nvf,
      ...
    }@inputs:
    let
      overlays = [ ];

      replace-by-set = import ./lib/replace-by-set.nix {lib = nixpkgs.lib;};
      
      helpers = { inherit replace-by-set; };

      mkSystem = import ./lib/mksystem.nix {
        inherit
          inputs
          overlays
          nixpkgs
          home-manager
	        nvf
          helpers
          ;
      };
      registry = import ./lib/registry.nix;

    in
    # make configuration for each entry in registry.configs
    # this returns attr set taking machine -> mkSystem {inherit machine user OS} for each {machine user OS} in registry.configs
    {
      nixosConfigurations = builtins.listToAttrs (
        builtins.map (entry: {
          name = entry.machine;
          value = mkSystem entry;
        }) registry.configs
      );
    };
}
