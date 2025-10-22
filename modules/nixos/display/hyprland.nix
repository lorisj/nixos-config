{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    nixos.display.hyprland.enabled = lib.mkEnableOption "enable hyprland";
    nixos.display.hyprland.enableNvidiaSupport = lib.mkEnableOption "enable if you are running on an nvidia gpu";
  };
  config = lib.mkIf config.nixos.display.hyprland.enabled {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    #environment.systemPackages = with pkgs; [
    #	waybar
    #   dunst
    #	libnotify
    #	rofi
    #    ];

    #    xdg.portal.enable = true;
    #    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    environment.sessionVariables = {
      # if cursor becomes invisible enable this:
      #WLR_NO_HARDWARE_CURSORS = "1";

      # hints electron apps to use wayland
      NIXOS_OZONE_WL = "1";
    };

    hardware = {
      #      opengl.enable = true;
      #      nvidia.modesetting.enable = config.nixos.display.hyprland.enableNvidiaSupport;
    };
  };
}
