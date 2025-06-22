{ pkgs, ... }: {
    ## Compilers, Interpreters, LSPs, Formatters and testing
    home.packages = with pkgs; [
        ## Rust
        cargo
        rust-analyzer
        rustPackages.rustfmt

        ## C/C++
        clang-tools
        gcc

        ## Python
        pyright
        black

        ## Java
        maven
        jdt-language-server-upstream ## my own derivation
        vscode-extensions.vscjava.vscode-java-debug
        vscode-extensions.vscjava.vscode-java-test
        lombok

        ## Lua
        lua
        lua-language-server
        stylua

        ## Zig
        zls
        zig

        ## Nix
        nil

        ## LLDB (zig, rust, cpp, c)
        lldb
    ];
}
