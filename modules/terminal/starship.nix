{ pkgs, config, ... }:
let 
colors = conifg.colorScheme.palette; # colors.base00, ... 
in{
  programs.starship = {
    enable = true;
  };
}
