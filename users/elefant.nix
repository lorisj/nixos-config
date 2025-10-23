{ inputs, ... }:
{
  gitConfig = {
    userName = "lorisj-elefant";
    userEmail = "loris@elefant.gg";
  };
  colorScheme = inputs.nix-colors.colorSchemes.danqing;
  wallpaperPath = ../.assets/van-sickle.jpg;
  home.web.firefoxProfile = {
    #    "browser.startup.homepage" = "https://nixos.org";
  };
}
