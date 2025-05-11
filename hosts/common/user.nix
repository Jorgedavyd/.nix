{ pkgs, username, timezone, locale, ... }:
{
    users.users.${username} = {
        isNormalUser = true;
        home = "/home/${username}";
        extraGroups = [ "wheel" "networkmanager" "video" "seat" ];
        shell = pkgs.bash;
    };
    time.timeZone = timezone;
    i18n.defaultLocale = locale;
}
