{ pkgs, ... }:

let
    treesitterWithGrammars = pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
        p.bash p.dockerfile p.gitattributes p.gitignore
        p.lua p.python
        p.toml p.yaml p.xml
        p.zig p.c p.cpp p.cuda p.rust
        p.cmake p.make p.nix
    ]);

    treesitter-parsers = pkgs.symlinkJoin {
        name = "treesitter-parsers";
        paths = treesitterWithGrammars.dependencies;
    };

    myPackages = with pkgs; [
        ## Treesitter
        vimPlugins.nvim-treesitter
        vimPlugins.telescope-nvim

        ## Compilers and interpreters
        rustc
        clang-tools
        python310
        jdk11
        lua
        zig

        ## Language servers
        lua-language-server
        jdt-language-server
        pyright
        rust-analyzer
        zls
        nil

        ## Formatters and tools
        stylua
        black
        cargo
        rustPackages.rustfmt
        maven

        ## testing
        lldb
    ];
in {
    programs.neovim = {
        enable = true;
        package = pkgs.neovim-unwrapped;
        plugins = [ treesitterWithGrammars ];
    };

    home.packages = myPackages;

    home.file."./.local/share/nvim/nix/nvim-treesitter/" = {
        recursive = true;
        source = treesitterWithGrammars;
    };
    
    home.file."./.local/share/nvim/nix/telescope-nvim/" = {
        recursive = true;
        source = pkgs.vimPlugins.telescope-nvim;
    };
}

