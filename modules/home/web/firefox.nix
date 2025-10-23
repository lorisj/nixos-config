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

      profiles.default = {
        id = 0;
        extensions.force = true;
        name = "default";
        isDefault = true;
        settings = config.home.web.firefoxProfile;
      };
    };

    programs.firefox.policies = {
      ExtensionSettings =
        with builtins;
        let
          extension = shortId: uuid: {
            name = uuid;
            value = {
              install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
              installation_mode = "normal_installed";
            };
          };
        in
        listToAttrs [
          #(extension "tree-style-tab" "treestyletab@piro.sakura.ne.jp")
          #(extension "ublock-origin" "uBlock0@raymondhill.net")
          (extension "tabliss" "extension@tabliss.io")
          (extension "proton-pass" "78272b6fa58f4a1abaac99321d503a20@proton.me")
        ];
      # To add additional extensions, find it on addons.mozilla.org, find
      # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
      # Then, download the XPI by filling it in to the install_url template, unzip it,
      # run `jq .browser_specific_settings.gecko.id manifest.json` or
      # `jq .applications.gecko.id manifest.json` to get the UUID
    };

  };
}
