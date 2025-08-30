# all config that is independant of machine, but for this user and OS
{
  config,
  pkgs,
  lib,
  options,
  ...
}@inputs:
let
  baseDir = ../../.;
  modulesDir = baseDir + "/modules";
in
{
  users.users.loris = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = [ pkgs.firefox ];
  };
  modules = [
    modulesDir + "/audio/pipewire.nix"
    modulesDir + "display/gnome.nix"   
  ];
}
