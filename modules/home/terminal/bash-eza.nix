{ pkgs, config, ... }:
let
  shellAliases = {
    ls = "eza --icons";
    gstatus = "git status";
    gadd = "git add";
    gcom = "git commit";
    gcheck = "git checkout";
    gpush = "git push";
  };
  #colors = conifg.colorScheme.palette; # colors.base00, ...
in
{
  programs.eza = {
    enable = true;
  };
  programs.bash = {
    enable = true;
    inherit shellAliases;
  };

  home.packages = [
    pkgs.nerd-fonts.fira-code # needed for exa --icons to work
  ];
}
