{ inputs, pkgs, ... }:
{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];
  stylix.enable = true;

  # need to set default themes for nixos:
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
  stylix.image = ../../../.assets/van-sickle.jpg;
}
