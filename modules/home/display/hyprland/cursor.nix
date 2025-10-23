{ pkgs, ... }:
{
  home.packages = [
    pkgs.hyprcursor
    pkgs.volantes-cursors
  ];
  wayland.windowManager.hyprland.settings = {
    input = {
      sensitivity = 0.2;
    };
    env = [
      "XCURSOR_THEME,volantes_cursors"
      "HYPRCURSOR_SIZE,24"
      "XCURSOR_SIZE,24"
      "HYPRCURSOR_THEME,volantes_cursors"
      "WLR_NO_HARDWARE_CURSORS,1"
    ];
  };
}
