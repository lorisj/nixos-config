{
  nixpkgs,
  overlays,
  inputs,
  home-manager,
}:
{
  machine,
  OS,
  users,
}:
let
  # Find directories/file locations:
  rootConfigDir = ../.;

  ## location for machine specific config
  machineBaseDir = "${rootConfigDir}/machines/${machine}";
  machineConfig = "${machineBaseDir}/configuration.nix";
  machine_meta = import "${machineBaseDir}/meta.nix";

  OSConfigFilename = "/OS/${OS}.nix";

  OSConfig = rootConfigDir + OSConfigFilename;

  ## Get user specific config (for each user, config for machine, OS, home-manager)
  getConfigFilesForUser = user: rec {
    userBaseDir = "${rootConfigDir}/users/${user}";

    userOSConfig = userBaseDir + OSConfigFilename;
    userMachineConfig = "${userBaseDir}/machine/${machine}.nix";
    userHMConfig = "${userBaseDir}/home-manager.nix";
  };

  ## for each user, should have: {user : import thisUsersHMConfig { inherit inputs; }}
  home-manager-users-set = builtins.listToAttrs (
    builtins.map (user: {
      name = user;
      value = import ((getConfigFilesForUser user).userHMConfig) { inherit inputs; };
    }) users
  );

  ## module directory:
  moduleBaseDir = "${rootConfigDir}/modules";

  # Utils
  systemFunc = nixpkgs.lib.nixosSystem;
  homeManager = home-manager.nixosModules.home-manager;
in
systemFunc rec {
  system = machine_meta.system;
  # inject these as params into all modules
  specialArgs = { inherit inputs moduleBaseDir; };
  modules = [
    # Apply overlays
    { nixpkgs.overlays = overlays; }
    { nixpkgs.config.allowUnfree = true; }
    machineConfig

    OSConfig

    homeManager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;

      home-manager.users = home-manager-users-set;
    }
  ]
  # no builtins.flatmap :(
  ++ (builtins.map (user : (getConfigFilesForUser user).userMachineConfig) users)
  ++ (builtins.map (user : (getConfigFilesForUser user).userOSConfig) users);
}
