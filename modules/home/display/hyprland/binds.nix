{ osConfig, ... }:
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
      #"$mod, L, exec, systemctl suspend"
      "$mod, F, fullscreen"
      "$mod, B, exec, firefox"
      "$mod, S, exec, hyprshot -m region"
    ]
    ++ (map getMTWBind keys)
    ++ (map getSWSBind keys);
    bindl =
      if osConfig.nixos.display.hyprland.laptopKeybinds then
        [
          ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ",XF86MonBrightnessUp, exec, brightnessctl s 2%+"
          ",XF86MonBrightnessDown, exec, brightnessctl s 2%-"
        ]
      else
        [ ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };

}
