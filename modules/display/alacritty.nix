{ pkgs, config, ... }:
{
  programs.alacritty.enable;
  programs.alacritty.settings = {

    colors = with config.colorScheme.colors; {
    
	
  };
};
}
