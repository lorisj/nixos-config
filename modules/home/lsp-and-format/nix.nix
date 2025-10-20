{ pkgs, config, inputs, ... }:
{
  home.packages = [ 
	pkgs.nixfmt-rfc-style # format
	pkgs.nixd # nix LSP
  pkgs.nixfmt
 ];	
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"]; # uses the same nixpkgs as this system
}