{
  nixpkgs,
  overlays,
  inputs,
  home-manager
}:
{
  machine,
  OS,
  user,
}:
let
  rootConfigDir = ../.;

  # machine specific config
  machineBaseDir = rootConfigDir + "machines/${machine}";
  machineConfig = machineBaseDir + "/configuration.nix"; # config for entire machine
  machine_meta = import machineBaseDir/meta.nix;

  OSConfigFilename = "/OS/${OS}.nix";

  OSConfig = rootConfigDir + OSConfigFilename;

  # User specific config (for each user, config for machine, OS, home-manager)
  userBaseDir = rootConfigDir + "/users/${user}";

  userOSConfig = userBaseDir + OSConfigFilename;
  userMachineConfig = userBaseDir + "/machine/${machine}.nix";
  userHMConfig = userBaseDir + "/home-manager.nix";

  # Utils
  systemFunc = nixpkgs.lib.nixosSystem;
  homeManager = home-manager.nixosModules;
in
systemFunc rec {
  system = machine_meta.system;
  modules = [
    # Apply overlays
    { nixpkgs.overlays = overlays; }
    { nixpkgs.config.allowUnfree = true; }

    machineConfig
    userMachineConfig
    userOSConfig
    home-manager.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${user} = import userHMConfig {
        inherit inputs;
      };
    }
  ];
}
