{ pkgs, config, ... }:
{
  enviornment.systemPackages = [ pkgs.nixfmt-rfc-style ];	
}
