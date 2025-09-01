{ config, pkgs, nvf, inputs, ... }:
let 
colors = config.colorScheme.palette;
in{
    imports = [
	nvf.homeManagerModules.default
    ];
    programs.nvf = {
        enable = true;
        settings = {
	    vim = {
                package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
		theme = {
		    enable = true;
	            name = "base16";
	            #style = "";
              base16-colors = with colors; {
                inherit base00 base01 base02 base03 base04 base05 base06 base07 base08 base09 base0A base0B base0C base0D base0E base0F;
              };
		};
		languages = {
		    nix = {
		    	enable = true;
		    };
		};
	    };
        };
    };
   
}
