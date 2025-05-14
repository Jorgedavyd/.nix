{ inputs, pkgs, ... }:
{
    programs.neovim = {
        enable = true;
        package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    };

    home.packages = with pkgs; [
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
}
