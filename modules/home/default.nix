{ inputs, ... }:
{
  home.stateVersion = "24.05";
  imports = builtins.filter (file: file != ./default.nix) (
    inputs.nix-helpers.lib.find-all-nix-files ./.
  );
}
