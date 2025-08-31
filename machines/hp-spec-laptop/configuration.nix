{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:
# TODO: in the future make a basic hardware template that: 
# 1) imports ./meta.nix as variable
# 2) sets hostname, timezone (move this as well)
# 3) imports ./hardware-configuration.nix
let
  meta = import ./meta.nix;
in
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = meta.hostName;

  time.timeZone = "America/Los_Angeles";

  hardware.bluetooth.enable = true;
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  services.printing.enable = true;

  system.stateVersion = "25.11";
}
