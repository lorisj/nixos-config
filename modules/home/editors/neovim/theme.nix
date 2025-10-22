{ config, lib, ... }:
let
  # colorschemes.base16.colorscheme expects #color
  # but config.colorScheme doesn't have #color, just color:
  colors =
    with config.colorScheme.palette;
    lib.mapAttrs (_name: value: "#" + value) {
      inherit
        base00
        base01
        base02
        base03
        base04
        base05
        base06
        base07
        base08
        base09
        base0A
        base0B
        base0C
        base0D
        base0E
        base0F
        ;
    };

in
{
  programs.nixvim = {
    colorschemes.base16.enable = true;
    # see here for option:
    # https://github.com/nix-community/nixvim/blob/e3b77e803b2350b72f4d72c8f175ab0fbfe5a642/plugins/colorschemes/base16/default.nix#L73
    colorschemes.base16.colorscheme = colors;
  };
}
