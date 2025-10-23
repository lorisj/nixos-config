{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mainMod, RETURN, exec, $terminal"
      "$mainMod SHIFT, Q, killactive,"
      "$mainMod SHIFT, E, exit,"
      "$mainMod, M, exec, $fileManager"
      "$mainMod, V, togglefloating,"
      "$mainMod, R, exec, $menu"
      "$mainMod, P, pseudo," # dwindle
      "$mainMod, J, togglesplit," # dwindle
      "$mainMod, L, exec,  systemctl suspend"
      "$mainMod, F, fullscreen"
      "mainMod, B, exec, firefox"
      "$mainMod, S, exec, hyprshot -m region"
    ];
  };
}
