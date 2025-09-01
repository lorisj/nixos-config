{
  config,
  lib,
  pkgs,
  inputs,
  moduleBaseDir,
  ...
}:

let
  isLinux = pkgs.stdenv.isLinux;
  
  terminalBaseDir = "${moduleBaseDir}/terminal";
  developmentBaseDir = "${moduleBaseDir}/development";
  neovimBaseDir = "${developmentBaseDir}/neovim";
  webBaseDir = "${moduleBaseDir}/web";
in
{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    "${developmentBaseDir}/nix-dev.nix"
    "${neovimBaseDir}/config.nix"  
    "${webBaseDir}/firefox.nix"
    "${terminalBaseDir}/alacritty.nix"
    "${terminalBaseDir}/bash-eza.nix"
    "${terminalBaseDir}/starship.nix"
  ];
  home.packages = [];

  programs.git = {
    enable = true;
    userName = "Loris Jautakas";
    userEmail = "lorisjautakas@gmail.com";
    extraConfig.init.defaultBranch = "main";
  };


  home.stateVersion = "25.05";

  # https://github.com/tinted-theming/base16-schemes?tab=readme-ov-file
  # for preview, see https://dt.iki.fi/base16-previews
  colorScheme = inputs.nix-colors.colorSchemes.solarized-dark;
}
