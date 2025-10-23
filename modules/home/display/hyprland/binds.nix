{ ... }:
let
  getMTWBind = x: "$mod SHIFT, ${builtins.toString x},movetoworkspace, ${builtins.toString x}";
  getSWSBind = x: "$mod, ${builtins.toString x}, workspace, ${builtins.toString x}";
  keys = [
    1
    2
    3
    4
    5
    6
    7
    8
    9
  ];
in
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
    ]
    ++ (map getMTWBind keys)
    ++ (map getSWSBind keys);

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };

}
