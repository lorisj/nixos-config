{ inputs, ... }:
let
  home-manager = inputs.home-manager;
  users = builtins.attrNames (builtins.readDir ../users);
  getUserContent = userName: import ../users/${userName}.nix;
in
{
  imports = [
    home-manager.nixosModules.home-manager
    {
      # shared HM modules:
      home-manager.shardModules = [
        ../../modules/home/default.nix
      ];
      # actually add all users:
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
      # HM config per user:
      home-manager.users = builtins.listToAttrs (
        builtins.map (userName: {
          name = userName;
          value = getUserContent userName;
        }) users
      );
    }
  ];
}
