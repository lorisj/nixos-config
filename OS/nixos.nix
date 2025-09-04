# all config that is independent of user and machine
{ config, pkgs, ... }@inputs:
{
  # Enable Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.settings = {
    substituters = [
      "https://cache.nixos.org"
      "https://ros.cachix.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "ros.cachix.org-1:dSyZxI8geDCJrwgvCOHDoAfOm5sV1wCPjBkKL+38Rvo="
    ];
  };

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
