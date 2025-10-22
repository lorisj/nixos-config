{
  programs.nixvim = {
    plugins = {
      oil = {
        enable = true;
        lazyLoad.settings.cmd = "Oil";
      };
      web-devicons.enable = true;
    };
  };
}
