{ pkgs, ... }:

let
    wallpaperSpec = [
        {
            url = "https://raw.githubusercontent.com/rose-pine/wallpapers/refs/heads/main/MC_dark_house_rain.png";
            sha256 = "sha256-PHVdefYSAhMHeejDzuZsIQId57PrOaAyPri4fCpX7Eg=";
        }
        {
            url = "https://raw.githubusercontent.com/rose-pine/wallpapers/main/MC_cave_sunset_view.png";
            sha256 = "sha256-aMVFkJPW06nPZSPPMykeZcmVF27YQBNhAUV7PMdAGo4=";
        }
        {
            url = "https://raw.githubusercontent.com/rose-pine/wallpapers/refs/heads/main/min-linux.jpg";
            sha256 = "sha256-OW8HujRALZ4jmJD9XGJIOc3IjRpFPmUzXY0XMsNIhCg=";
        }
        {
            url = "https://raw.githubusercontent.com/rose-pine/wallpapers/refs/heads/main/Arch.png";
            sha256 = "sha256-skyY8GjHuZ2sU0YfnSxKvfvB/96EuZ7bPx+ke1jA2Fw=";
        }
    ];

    basename = url:
        let
            matches = builtins.match ".*/([^/]+)$" url;
        in
            if matches != null then builtins.head matches else "wallpaper";

    wallpaperFiles = builtins.listToAttrs (builtins.map (spec: {
        name = ".local/state/wallpapers/${basename spec.url}";
        value = {
            source = pkgs.fetchurl {
                url = spec.url;
                sha256 = spec.sha256;
            };
        };
    }) wallpaperSpec);
in {
    home.file = wallpaperFiles;
}
