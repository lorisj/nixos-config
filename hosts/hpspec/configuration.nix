# flake parts module w/ nixos config
{ flake, inputs, ... }:
{
  flake.nixosConfigurations.hpspec = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = [
      inputs.home-manager.nixosModules.home-manager
      ./hardware-configuration.nix
      ../../modules/nixos/default.nix
      {
        hardware.bluetooth.enable = true;

        time.timeZone = "America/Los_Angeles";

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

        nixos.display.hyprland.enabled = true;
        nixos.display.hyprland.displayScaling = 2;
        nixos.display.hyprland.laptopKeybinds = true;
      }
    ];
  };
}
