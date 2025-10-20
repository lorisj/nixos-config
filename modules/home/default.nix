{ inputs, ... }:
{
  home.stateVersion = "24.05";
  imports =[ 
    inputs.nix-colors.homeManagerModules.default
  ] ++ builtins.filter (file: file != ./default.nix) (
    inputs.nix-helpers.lib.find-nix-files ./.
  );
}
