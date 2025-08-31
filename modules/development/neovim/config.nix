{ config, pkgs, nvf, ... } @ inputs :
{
    imports = [
	nvf.homeManagerModules.default
	];
}
