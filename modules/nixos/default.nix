{
  inputs,
  lib,
  pkgs,
  ...
}@moduleAttrs:
let
  users = map (fileName: lib.removeSuffix ".nix" fileName) (
    builtins.attrNames (builtins.readDir ../../users)
  );
  getUserContent = userName: import ../../users/${userName}.nix;
  nixosModules = builtins.filter (file: file != ./default.nix) (
    inputs.nix-helpers.lib.find-nix-files ./.
  );
in
{
  imports = nixosModules ++ [
    inputs.stylix.nixosModules.stylix
    {
      home-manager.useGlobalPkgs = true;
      home-manager.sharedModules = [
        ../../modules/home/default.nix
      ];
      home-manager.extraSpecialArgs = { inherit inputs; };
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
          value = (getUserContent userName) moduleAttrs;
        }) users
      );
    }
  ];

  environment.systemPackages = with pkgs; [
    wget
    gnumake
  ];
}
