{
  description = "NixOS configuration";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-helpers.url = "github:lorisj/nix-helpers";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:lorisj/nvf?ref=stable"; # pin to stable release
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };

  };

  outputs =
    inputs@{ flake-parts, nix-helpers, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports =
        (
          with builtins;
          map (moduleName: ./modules/flake-parts/${moduleName}) (attrNames (readDir ./modules/flake-parts))
        )
        # imports all configuration.nix files within ./hosts
        ++ (nix-helpers.lib.find-all-files-by-name ./hosts "configuration.nix");
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      perSystem =
        {
          config,
          self',
          inputs',
          pkgs,
          system,
          ...
        }:
        {
          # Per-system attributes can be defined here. The self' and inputs'
          # module parameters provide easy access to attributes of the same
          # system.
        };

      flake = {
        # The usual flake attributes can be defined here, including system-
        # agnostic ones like nixosModule and system-enumerating ones, although
        # those are more easily expressed in perSystem.

      };
    };
}
