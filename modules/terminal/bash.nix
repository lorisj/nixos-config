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
in{
  programs.bash = {
    enable = true;
    inherit shellAliases;
  };
}
