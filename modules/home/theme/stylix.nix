{ config, ... }:
{
  options = {
    wallpaperPath = lib.mkOption {
      description = "Path to wallpaper to use w/ stylix";
      type = lib.types.path;
    };
  };
  stylix.base16Scheme = config.colorScheme.palette;
  stylix.image = config.wallpaperPath;
}
