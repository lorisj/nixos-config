{
  inputs,
  config,
  lib,
  ...
}:
let
  cssContent = builtins.readFile ./wofi.css;
  style = inputs.nix-helpers.lib.replace-by-set {
    inherit lib;
  } config.colorScheme.palette (cssContent);
in
{
  programs.wofi.enable = true;
  programs.wofi.settings = {
  	show="drun";
	location = "center";
 	width = 800;
	height = 700;
	image_size = 40;
	allow_images = true;
	insensitive=true;
	prompt="Search:";
  };
  programs.wofi.style = style;
}
