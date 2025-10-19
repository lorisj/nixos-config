{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./display/gnome.nix
    ./network/network-manager.nix
  ];
  # imports = builtins.filter (file: file != ./default.nix) (inputs.nix-helpers.lib.find-nix-files ./.);
  # User independent packages
  environment.systemPackages = with pkgs; [
    wget
    git
    gnumake # makefiles
    alacritty
  ];
}
