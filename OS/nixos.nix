# all config that is independent of user and machine
{ config, pkgs, ... }@inputs:
{
  # Enable Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # User independent packages
  environment.systemPackages = with pkgs; [
    wget
    git
    gnumake # makefiles
    alacritty
  ];

  fonts.packages = [ pkgs.nerd-fonts.fira-code ]; # needed for exa --icons to work

  # Enable networking
  networking.networkmanager.enable = true;
}
