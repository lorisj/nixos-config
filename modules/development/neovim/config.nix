{ config, pkgs, nvf, ... } @ inputs :
{
    imports = [
	nvf.homeManagerModules.default
    ];
    programs.nvf = {
        enable = true;
        settings = {
	    vim = {
		theme = {
		    enable = true;
	            name = "solarized";
	            style = "dark";
		};
		#languages = {
		    #nix = {
		    #	enable = true;
		    #};
		#};
	    };
        };
    };
   
}
