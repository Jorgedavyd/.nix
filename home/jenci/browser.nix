_: {
    programs.firefox = {
        enable = true;
        profiles.jenci = {
            isDefault = true;
            userChrome = ''
          @import "${builtins.fetchGit {
                    url = "https://github.com/cascadefox/cascade.git";
                    ref = "main";
                    rev = "f8c6bb5a36f24aba61995204ff5497c865e78e50";
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
