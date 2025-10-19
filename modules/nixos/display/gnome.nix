{
  lib,
  config,
  ...
}:
{
  # options = {
  # nixos.display.gnome.enable = lib.mkEnableOption "enables gnome";
  # };
  # config = lib.mkIf config.nixos.display.gnome.enable {
  services.xserver.enable = true;

  # enables gnome desktop
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # };
}
