{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    nixos.display.hyprland.enabled = lib.mkEnableOption "hyprland";
    nixos.display.hyprland.displayScaling = lib.mkOption{
      type = lib.types.int;
      default = 1;
      description = "window scaling";
    };
    nixos.display.hyprland.enableNvidiaSupport = lib.mkEnableOption "nvidia GPU support";
  };
  config = lib.mkIf config.nixos.display.hyprland.enabled {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    environment.systemPackages = with pkgs; [
      waybar
      dunst
      libnotify
      rofi
    ];

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    environment.sessionVariables = {
      # if cursor becomes invisible enable this:
      #WLR_NO_HARDWARE_CURSORS = "1";

      # hints electron apps to use wayland
      NIXOS_OZONE_WL = "1";
    };

    hardware = {
      graphics.enable = true;
      nvidia.modesetting.enable = config.nixos.display.hyprland.enableNvidiaSupport;
    };
  };
}
