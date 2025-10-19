{
  # options = {
  # nixos.nix.nix-settings.enableSubstituters = lib.mkEnableOption "enables substituters (cache)";
  # };
  # config = {
  nix.settings.substituters = [
    "https://cache.nixos.org"
  ];

  nix.settings.trusted-public-keys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # };
}
