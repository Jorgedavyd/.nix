_: {
    programs.git = {
        enable = true;
        settings = {
            user = {
                name = "Jorgedavyd";
                email = "jorged.encyso@gmail.com";
            };
            init.defaultBranch = "main";
            pull.rebase = true;
            credential.helper = "!gh auth git-credential";
        };
    };
}
