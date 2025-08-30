{ inputs, ... }:

{
  config,
  lib,
  pkgs,
  ...
}:

let
  isLinux = pkgs.stdenv.isLinux;
  shellAliases = {
    gadd = "git add";
    gcom = "git commit";
    gchc = "git checkout";
    gpsh = "git push";
  };
in
{


  home.packages = [];

  programs.neovim = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Loris Jautakas";
    userEmail = "lorisjautakas@gmail.com";
    extraConfig.init.defaultBranch = "main";
  };

  home.stateVersion = "25.05";
}
