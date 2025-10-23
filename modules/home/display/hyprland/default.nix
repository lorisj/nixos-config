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
      "$fileManager" = "dolphin";
      "$menu" = "rofi -show drun --style=${./rofi-style.css}";
      monitor = [
        ",prefered,auto,${builtins.toString osConfig.nixos.display.hyprland.displayScaling}"
      ];
      decoration = {
        rounding = 15;
        active_opacity = 0.95;
        inactive_opacity = 0.8;
        fullscreen_opacity = 0.99;
      };

      exec-once = [
        "${pkgs.waybar}/bin/waybar"
      ];

      input = {
        sensitivity = 0.2;
      };

      bind = [
        "$mod, RETURN, exec, $terminal"
        "$mod SHIFT, Q, killactive,"
        "$mod SHIFT, E, exit,"
        "$mod, M, exec, $fileManager"
        "$mod, V, togglefloating,"
        "$mod, R, exec, $menu"
        "$mod, P, pseudo," # dwindle
        "$mod, J, togglesplit," # dwindle
        "$mod, L, exec,  systemctl suspend"
        "$mod, F, fullscreen"
        "$mod, B, exec, firefox"
        "$mod, S, exec, hyprshot -m region"
      ];
    };

    plugins = [
      pkgs.hyprlandPlugins.hy3
    ];
  };
}
