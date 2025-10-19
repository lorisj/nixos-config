{
  lib,
  config,
  ...
}:
{
  # options = {
  #   nixos.network.networkManager.enable = lib.mkEnableOption "enables network manager";
  # };

  # config = lib.mkIf config.nixos.network.networkManager.enable {
  networking.networkmanager.enable = true;
  # };
}
