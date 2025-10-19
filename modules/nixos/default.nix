{ inputs, pkgs, ... }:
let
  users = builtins.attrNames (builtins.readDir ../../users);
  getUserContent = userName: import ../../users/${userName};
in 
{
imports = ([
    ./display/gnome.nix
    ./network/network-manager.nix
    ./nix/nix-settings.nix
  ])++ [
{
home-manager.useGlobalPkgs = true;
home-manager.sharedModules = [
	../../modules/home/default.nix
];
users.users = builtins.listToAttrs (
        builtins.map (userName: {
          name = userName;
          value = {
            # TODO: make these as options 
            isNormalUser = true;
            extraGroups = [
              "networkmanager"
              "wheel"
            ];
          };
        }) users
      );

home-manager.users = builtins.listToAttrs (
        builtins.map (userName: {
          name = userName;
          value = getUserContent userName;
        }) users
      );
}
];
  # imports = builtins.filter (file: file != ./default.nix) (inputs.nix-helpers.lib.find-nix-files ./.);


environment.systemPackages = with pkgs;[
wget
gnumake
alacritty
];
}
