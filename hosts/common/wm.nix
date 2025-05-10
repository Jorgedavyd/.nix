_: {
    programs.hyprland = {
        enable = true;
        xwayland = {
            hidpi = true;
            enable = true;
        };
    };
    security.pam.services.hyrplock = {
        text = ''
            auth include login
            '';
    };
}
