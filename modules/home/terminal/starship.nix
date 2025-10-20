{ pkgs, config, inputs, ... }:
let 
colors = config.colorScheme.palette; # colors.base00, ... 
in{
  programs.starship = {
    enable = true;
    settings = builtins.fromTOML(inputs.nix-helpers.lib.replace-by-set colors (builtins.readFile ./starship-config.toml)); # settings is of type TOML value
  };
}