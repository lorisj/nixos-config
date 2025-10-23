{
  pkgs,
  config,
  osConfig,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    xwayland.enable = true;
    settings = {
      "$mod" = "super";
      "$terminal" = "kitty";
      "$fileManager" = "thunar";
      "$menu" = "wofi --show drun";
      monitor = [
        ",prefered,auto,${builtins.toString osConfig.nixos.display.hyprland.displayScaling}"
      ];

      exec-once = [
        "${pkgs.waybar}/bin/waybar"
      ];
    };

    plugins = [
      pkgs.hyprlandPlugins.hy3
    ];
  };
}
