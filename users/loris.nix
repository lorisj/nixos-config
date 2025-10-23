{ inputs, ... }:
{
  gitConfig = {
    userName = "lorisj";
    userEmail = "lorisjautakas@gmail.com";
  };
  colorScheme = inputs.nix-colors.colorSchemes.danqing;
  wallpaperPath = ../.assets/round-hill.jpg;
}
