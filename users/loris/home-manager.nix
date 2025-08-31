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
  shellAliases = {
    gadd = "git add";
    gcom = "git commit";
    gchc = "git checkout";
    gpsh = "git push";
  };
  displayBaseDir = "${moduleBaseDir}/display";
  developmentBaseDir = "${moduleBaseDir}/development";
in
{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    "${displayBaseDir}/alacritty.nix"
    "${developmentBaseDir}/nix-dev.nix"
  ];
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

  # https://github.com/tinted-theming/base16-schemes?tab=readme-ov-file
  # for preview, see https://dt.iki.fi/base16-previews
  colorScheme = inputs.nix-colors.colorSchemes.solarized-dark;
}
