{ ... }:
{
  wayland.windowManager.hyprland.settings = {
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

}
