{ config, lib, ... }:
{
  options = {
    home.web.firefoxProfile = lib.mkOption {
      type = lib.types.attrs;
    };
  };
  config = {
    programs.firefox = {
      enable = true;
#      profiles.default = {
#	id = 0;
#	name = "default";
#	isDefault = true;
#	settings = config.home.web.firefoxProfile;
#      };
    };
  };
}
