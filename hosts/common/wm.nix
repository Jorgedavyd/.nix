_: {
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };
    security.pam.services.hyrplock = {
        text = ''
            auth include login
            '';
    };
}
