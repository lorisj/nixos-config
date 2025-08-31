{ inputs, moduleBaseDir, ... }:

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
  imports = [
    inputs.nix-colors.homeManagerModules.default
    "${moduleBaseDir}/display/alacritty.nix"
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
