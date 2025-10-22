{
  config,
  lib,
  ...
}:
{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
  };
}
