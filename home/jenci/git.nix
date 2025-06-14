_: {
    programs.git = {
        enable = true;
        userName = "Jorgedavyd";
        userEmail = "jorged.encyso@gmail.com";
        extraConfig = {
            init.defaultBranch = "main";
            pull.rebase = true;
            credential.helper = "!gh auth git-credential";
        };
    };
}
