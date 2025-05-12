_: {
    home.file = {
        ".bashrc".source = ./bash/.bashrc;
        ".bash_profile".source = ./bash/.bash_profile;
        ".local/scripts" = {
            source = ./scripts;
            recursive = true;
        };
    };
}
