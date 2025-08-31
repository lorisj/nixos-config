{ config, pkgs, ... } @ inputs :
{
  services.xserver.enable = true;


  # enable gnome desktop
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}