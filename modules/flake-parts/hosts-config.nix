{ inputs, ... }:
{
  imports = # imports all configuration.nix files within ./hosts
    (inputs.nix-helpers.lib.find-all-files-by-name ../../hosts "configuration.nix");
}
