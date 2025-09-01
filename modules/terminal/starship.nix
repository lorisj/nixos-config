{ pkgs, config, ... }:
let 
#colors = conifg.colorScheme.palette; # colors.base00, ... 
in{
  programs.starship = {
    enable = true;
    settings = builtins.fromTOML (builtins.readFile ./starship-config.toml); # settings is of type TOML value
  };
}
