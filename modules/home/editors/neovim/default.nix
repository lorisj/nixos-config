{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    nixpkgs.useGlobalPackages = true;

    viAlias = true;
    vimAlias = true;

    plugins = {
      # Lazy loading
      lz-n.enable = true;
    };
  };
}
