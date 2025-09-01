{ config, pkgs, nvf, inputs, ... }:
{
    imports = [
	nvf.homeManagerModules.default
    ];
    programs.nvf = {
        enable = true;
        settings = {
	    vim = {
                package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
		#theme = {
		#    enable = true;
	        #    name = "solarized";
	        #    style = "dark";
		#};
		#languages = {
		    #nix = {
		    #	enable = true;
		    #};
		#};
	    };
        };
    };
   
}
