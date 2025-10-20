{ inputs, lib, pkgs, ... }:
let
  users = map (fileName : lib.removeSuffix ".nix" fileName ) (builtins.attrNames (builtins.readDir ../../users));
  getUserContent = userName: import ../../users/${userName}.nix;
  nixosModules = builtins.filter (file: file != ./default.nix) (inputs.nix-helpers.lib.find-nix-files ./.);
in 
{
imports = nixosModules ++ [
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


environment.systemPackages = with pkgs;[
wget
gnumake
alacritty
];
}
