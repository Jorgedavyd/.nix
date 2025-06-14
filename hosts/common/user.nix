{ pkgs, username, timezone, locale, ... }:
{
    users.users.${username} = {
        isNormalUser = true;
        home = "/home/${username}";
        extraGroups = [ "docker" "wheel" "networkmanager" "video" "seat" "network" "render" ];
        shell = pkgs.zsh;
    };
    time.timeZone = timezone;
    i18n.defaultLocale = locale;
}
