_: {
    programs.firefox = {
        enable = true;
        profiles.jenci = {
            isDefault = true;
            userChrome = ''
          @import "${builtins.fetchGit {
                    url = "https://github.com/cascadefox/cascade.git";
                    ref = "main";
                    rev = "dc40a861b24b378982c265a7769e3228ffccd45a";
                }}/chrome/userChrome.css";
            '';
            settings = {
                "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
                "browser.translations.automaticallyPopup" = false;
                "browser.cache.disk.enable" = false;
            };
        };
    };
}
